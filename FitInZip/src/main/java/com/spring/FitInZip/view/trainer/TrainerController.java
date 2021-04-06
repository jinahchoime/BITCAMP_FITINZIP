package com.spring.FitInZip.view.trainer;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.imageio.IIOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.cls.clsStatus.Criteria;
import com.spring.FitInZip.back.cls.clsStatus.PageDTO;
import com.spring.FitInZip.back.cls.clsStatusService.ClsStatusService;
import com.spring.FitInZip.back.cls.vo.ClsTrainerDTO;
import com.spring.FitInZip.back.cls.vo.ClsVO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.trainer.TrainerService;
import com.spring.FitInZip.back.trainer.vo.RegisterTrainerDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerCalDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerReviewDTO;

@Controller
@SessionAttributes({ "admin", "member"/* , "reviewList", "calList" */})
public class TrainerController {
	private static final Logger logger = LoggerFactory.getLogger(TrainerController.class);

	@Autowired
	private TrainerService trainerService;

	@Autowired
	private ClsStatusService clsStatusService;

	public TrainerController() {
		System.out.println("trainerController 접속");
	}

	// 강사 등록하기 페이지
	@RequestMapping("/registerTrainerMainPage")
	public String registerView() {
		//return "trainer/registerTrainerMainPage";
		return "pay/LivePTPay";
	}

	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerFormView() {
		return "trainer/registerForm";
	}

	@RequestMapping(value = "registerForm/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int count = trainerService.idCheck(id);
		System.out.println("count: " + count);
		return count;
	}

	@RequestMapping(value = "/registerForm", method = RequestMethod.POST)
	public String registerForm(RegisterTrainerDTO dto) throws Exception {
		System.out.println(">>>>>>>>>>registerForm dto : " + dto);
		trainerService.insertTrainer(dto);
		System.out.println("강사 등록하기 성공!");
		return "main";
    }

	// 강사/관리자 로그인
	@RequestMapping(value = "/trainerLogin", method = RequestMethod.GET)
	public String loginView(RegisterTrainerDTO dto) {
		return "trainer/trainerLogin";
	}

	//로그인 시 데이터 전달 (강사/관리자 확인)
    @RequestMapping(value = "/trainerLogin", method = RequestMethod.POST) 
    @ResponseBody
    public MemberVO loginTrainer(MemberVO vo, Model model) throws Exception {
    	System.out.println("trainerCheck!");	
    	MemberVO mvo = trainerService.loginFirst(vo);
    	model.addAttribute("admin", mvo);
    	return mvo;
    }
    
    
    //강사 로그인
    @RequestMapping("/trainerMainPage") 
    public String mainPage(RegisterTrainerDTO dto, @ModelAttribute("admin") MemberVO vo, Model model) {
    	// System.out.println("mvo: " + vo); 
    	System.out.println("mvo 타입: " + vo.getRole()); 
    	dto.setId(vo.getId());
    	dto.setPassword(vo.getPassword());
    	RegisterTrainerDTO member = trainerService.loginTrainer(dto);
    	 
    	String reqClass = trainerService.mainPage1(member);
     	System.out.println("Controller reqClass: " + reqClass);
     	model.addAttribute("reqClass", reqClass);
   
     	String ingClass = trainerService.mainPage2(member);
     	model.addAttribute("ingClass", ingClass);
   
     	String totalCal = trainerService.mainPage3(member);
     	model.addAttribute("totalCal", totalCal);
     	
    	 System.out.println("로그인 member: " + member);
    	 model.addAttribute("member", member);
    	 
    	 return "trainer/trainerMainPage";
    }
    //마이클래스
	/*
	 * @RequestMapping("/myClass") public String myPage(@ModelAttribute("member")
	 * RegisterTrainerDTO dto, Model model) { List<ClsTrainerDTO> cvo1 =
	 * trainerService.myPage1(dto); System.out.println("cvo1: " + cvo1);
	 * model.addAttribute("ingCls", cvo1); List<ClsTrainerDTO> cvo2 =
	 * trainerService.myPage2(dto); System.out.println("cvo2: " + cvo2);
	 * model.addAttribute("edCls", cvo2); return "trainer/myClass"; }
	 */
    
    @RequestMapping("/myClass") 
    public String myPageView(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	List<ClsTrainerDTO> edCls = trainerService.myPage2(dto);
    	System.out.println("edCls: " + edCls);
    	model.addAttribute("edCls", edCls);
    	return "trainer/myClass";
    }
    
    @RequestMapping("/classData") 
    @ResponseBody
    public List<ClsTrainerDTO> myPage(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	
    	List<ClsTrainerDTO> ingCls = trainerService.myPage1(dto);
    	System.out.println("ingCls: " + ingCls);
    	model.addAttribute("ingCls", ingCls);
    	List<ClsTrainerDTO> edCls = trainerService.myPage2(dto);
    	System.out.println("edCls: " + edCls);
    	model.addAttribute("edCls", edCls);
    	return ingCls;
	}
    
    //내 정보 수정
    @RequestMapping(value = "/changeInfo", method = RequestMethod.GET) 
    public String changeInfoView(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	RegisterTrainerDTO info = trainerService.trainerInfo(dto);
    	System.out.println("trainerINFO: " + info);
    	model.addAttribute("trainerInfo", info);
    	
    	return "trainer/changeInfo";
	}
    
    @RequestMapping(value = "/changeInfo", method = RequestMethod.POST) 
    public String changeInfo(@ModelAttribute("member") RegisterTrainerDTO dto) {
    	
    	trainerService.updateInfo1(dto);
    	trainerService.updateInfo2(dto);

    	System.out.println("정보 수정 성공!");
		
    	return "trainer/trainerMainPage";
	}
    
    //내 리뷰 확인
    @RequestMapping("/myReview")
    public String checkReview(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	List<TrainerReviewDTO> list = trainerService.checkReview(dto);
    	model.addAttribute("reviewList", list);
    	System.out.println("리뷰 보여준다~~");
    	return "trainer/myReview";
    }
    
    //정산하기	
    @RequestMapping(value = "/myCalculation", method = RequestMethod.GET) 
    public String checkCal(@ModelAttribute("member") RegisterTrainerDTO dto, HashMap<String, String> map, Model model) {
    	
    	map.put("id", dto.getId());
    	
    	//System.out.println("map: " + map);
    	List<TrainerCalDTO> calList = trainerService.checkCal(map);
	    model.addAttribute("calList", calList); 
	    System.out.println("내역 보여준다~");
	    return "trainer/myCalculation"; 
	    }
    
    @RequestMapping(value = "/myCalculation", method = RequestMethod.POST) 
    @ResponseBody
    public List<TrainerCalDTO> checkCalList(@ModelAttribute("member") RegisterTrainerDTO dto, @RequestParam("dateFrom") String dateFrom, @RequestParam("dateTo")
	  String dateTo, HashMap<String, String> map) throws Exception {
    	map.put("id", dto.getId());
    	map.put("sDate", dateFrom);
    	map.put("eDate", dateTo);
    	System.out.println("map: " + map);
    	
	    List<TrainerCalDTO> calList2 = trainerService.checkCal(map); 
	    System.out.println("calList2: " + calList2);
	    return calList2;
    }
	
    @RequestMapping("/myWithdraw")
    public String myWithdrawView() {
    	return "trainer/myWithdraw";
    }
    
    @RequestMapping("/myWithdrawCheck")
    public String myWithdraw(@ModelAttribute("member") RegisterTrainerDTO dto, RedirectAttributes rttr) {

    	System.out.println("dto:" + dto);
    	
    	trainerService.updateCal(dto);
    	
    	System.out.println("정산금 인출 신청 성공!");
    	return "redirect:trainerMainPage";
    }
    

    //로그아웃
    @RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println(">>>로그아웃 처리");
		// 1. 세션초기화(세션객체를 종료)
		session.invalidate(); // 현재 사용중인 세션을 무효화처리

		// 2. 화면 네비게이션(로그인페이지)
		return "main";
		
	}
    
    
    
    
    //동현
	@RequestMapping(value = "classStat")
	public String goClassStat(@ModelAttribute("member") RegisterTrainerDTO dto, Criteria crt, Model model) {
		crt.setTrainerId(dto.getId());
		String filePath = this.getClass().getResource("").getPath(); 
		filePath = filePath.substring(1, filePath.indexOf(".metadata")) +
			    "FitInZip/src/main/webapp/resources/classRegister/imgs/";
		
		System.out.println("path : " + filePath);

		List<ClsVO> list = clsStatusService.getList(crt);
		//System.out.println("list: " + list + " , list size: " + list.size());
		int count = clsStatusService.getTotal(dto.getId());
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(crt, count)); // 뒤 쪽 매개변수는 총 데이터 개수

		return "trainer/classStatus";
	}

	@RequestMapping(value = "classRegister")
	public String goRegister(Criteria crt, Model model) {
		
		model.addAttribute("pageNum", crt.getPageNum());
		model.addAttribute("amount", crt.getAmount());
		
		return "trainer/classRegister";
	}

	@RequestMapping(value = "regCls")
	public String regClsProc(@ModelAttribute("member") RegisterTrainerDTO dto, ClsVO vo, @ModelAttribute("crt") Criteria crt, RedirectAttributes rttr,
			@RequestParam(value = "clsTag", required = false) String clsTag,
			@RequestParam(value = "equip", required = false) String equip, MultipartFile thumbnail, MultipartFile title,
			HttpServletRequest request)
			throws IllegalStateException, IIOException, Exception {
		
		MultipartFile classUploadFile = null;
	    String filePath = this.getClass().getResource("").getPath(); 
	    filePath = filePath.substring(1, filePath.indexOf(".metadata")) +
	    "FitInZip/src/main/webapp/resources/classRegister/imgs/";
		 
		System.out.println(vo.getStartDate());

		// 클래스 코드를 생성하기
		java.util.Date now = new java.util.Date();
		SimpleDateFormat vans = new SimpleDateFormat("yyyyMMdd");
		String wdate = vans.format(now);

		String classKey = clsStatusService.getClassSeq();
		
		if(Integer.parseInt(classKey) < 10) {
			classKey = "0" + classKey;
		}
		
		String classCode = "C" + wdate + "_" + classKey;
		UUID uuid = null;
		String filename = "";
		/*
		 * String filePath = ""; filePath = "C:/FitInZip_Images/";
		 */
		
		if(thumbnail != null) {
			uuid = UUID.randomUUID();
			filename = thumbnail.getOriginalFilename();
			vo.setThumbnailOriName(filename);
			
			if(filename != null && !filename.equals("")) {
				filename = filePath + "thumbnail/" + uuid + "_" + filename;
				vo.setThumbnailFileName(filename);
				classUploadFile = thumbnail;
				classUploadFile.transferTo(new File(filename));
			}
			
		}
		
		if(title != null) {
			uuid = UUID.randomUUID();
			filename = title.getOriginalFilename();
			vo.setTitleOriName(filename);
			
			if(filename != null && !filename.equals("")) {
				filename = filePath + "title/" + uuid + "_" + filename;
				vo.setTitleFileName(filename);
				classUploadFile = title;
				classUploadFile.transferTo(new File(filename));
			}
			
		}
		// 시작, 끝 시간 입력을 위한 가공
		SimpleDateFormat converter = new SimpleDateFormat("yyyy-MM-dd");

		Date start = vo.getStartDate();
		Date end = vo.getEndDate();

		String startTime = "" + converter.format(start);
		String endTime = "" + converter.format(end);

		startTime += " " + vo.getStartTime() + ":00";
		endTime += " " + vo.getEndTime() + ":00";

		vo.setStartTime(startTime);
		vo.setEndTime(endTime);

		System.out.println("starttime: " + startTime + ", endtime: " + endTime);
		
		vo.setTrainerId(dto.getId());
		/* vo.setClsOriName(fileName); */
		vo.setClsCode(classCode);

		System.out.println("vo: " + vo.toString());

		clsStatusService.insertClass(vo);

		rttr.addAttribute("pageNum", crt.getPageNum());
		rttr.addAttribute("amount", crt.getAmount());

		return "redirect:classStat";
	}

	// 수정 화면으로 이동
	@RequestMapping(value = "modifyClass")
	public String modifyClass(@ModelAttribute("member") RegisterTrainerDTO dto, HttpServletRequest request,
			Model model, @ModelAttribute("crt") Criteria crt) {
		String clsCode = request.getParameter("clsCode");

		ClsVO vo = new ClsVO();
		vo.setClsCode(clsCode);
		vo.setTrainerId(dto.getId());

		ClsVO getCls = clsStatusService.getClass(vo);

		Date startDate = getCls.getStartDate();
		Date endDate = getCls.getEndDate();

		String startTime = getCls.getStartTime();
		String endTime = getCls.getEndTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String start = sdf.format(startDate);
		String end = sdf.format(endDate);

		startTime = startTime.substring(11, 16);
		endTime = endTime.substring(11, 16);
		
		String thumbnailPath = getCls.getThumbnailFileName();
		String titlePath = getCls.getTitleFileName();
		
		getCls.setThumbnailFileName(getCls.getThumbnailFileName().substring(thumbnailPath.indexOf("resources")));
		getCls.setTitleFileName(getCls.getTitleFileName().substring(titlePath.indexOf("resources")));

		model.addAttribute("cls", getCls);
		model.addAttribute("startDate", start);
		model.addAttribute("endDate", end);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		
		model.addAttribute("pageNum", crt.getPageNum());
		model.addAttribute("amount", crt.getAmount());

		return "trainer/updateClass";
	}

	// update 작업 수행
	@RequestMapping(value = "modClassProc")
	public String modifyProc(ClsVO vo, @ModelAttribute("member") RegisterTrainerDTO dto, HttpServletRequest request,
			Model model, @ModelAttribute("crt") Criteria crt, RedirectAttributes rttr,
			// 클래스 태그, 필요한 기구, 시작 일자, 끝 일자, 시작 시간, 끝 시간은 빈 값을 허용.
			// 날짜와 시간이 비는 경우, 기존 값 유지
			@RequestParam(value = "clsTag", required = false) String clsTag,
			@RequestParam(value = "equip", required = false) String equip,
			MultipartFile thumbnail, MultipartFile title) throws Exception {
		
		SimpleDateFormat converter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date start = vo.getStartDate();
		Date end = vo.getEndDate();

		String startTime = "" + converter.format(start);
		String endTime = "" + converter.format(end);

		startTime += " " + vo.getStartTime() + ":00";
		endTime += " " + vo.getEndTime() + ":00";

		vo.setStartTime(startTime);
		vo.setEndTime(endTime);
		
		// 파일 처리
		//String filePath = "C:/MyStudy/Final_Project/Project/BITCAMP_FITINZIP/FitInZip/bin/src/main/webapp/resources/classRegister/imgs/";
		String filePath = this.getClass().getResource("").getPath(); 
	    filePath = filePath.substring(1, filePath.indexOf(".metadata")) +
	    "FitInZip/src/main/webapp/resources/classRegister/imgs/";
		
		
		if(thumbnail.getOriginalFilename().equals("")) {
			String oriFileName = request.getParameter("thumbnailOriName");
			String uploadedFileName = request.getParameter("thumbnailFileName");
			vo.setThumbnailOriName(oriFileName);
			//vo.setThumbnailFileName("C:/MyStudy/Final_Project/Project/BITCAMP_FITINZIP/FitInZip/bin/src/main/webapp/" + uploadedFileName);
			vo.setThumbnailFileName(filePath.substring(0, filePath.indexOf("webapp/")) + uploadedFileName);
		} else {
			MultipartFile uploadFile = thumbnail;
			UUID uuid = UUID.randomUUID();
			String fileName = thumbnail.getOriginalFilename();
			vo.setThumbnailOriName(fileName);
			fileName = filePath + "thumbnail/" + uuid + "_" + fileName;
			vo.setThumbnailFileName(fileName);
			uploadFile.transferTo(new File(fileName));
			
			File file = new File(filePath.substring(0, filePath.indexOf("resources")) + request.getParameter("thumbnailFileName"));
			file.delete();
		}
		
		if(title.getOriginalFilename().equals("")) {
			String oriFileName = request.getParameter("titleOriName");
			String uploadedFileName = request.getParameter("titleFileName");
			vo.setTitleOriName(oriFileName);
			//vo.setTitleFileName("C:/MyStudy/Final_Project/Project/BITCAMP_FITINZIP/FitInZip/bin/src/main/webapp/" + uploadedFileName);
			vo.setTitleFileName(filePath.substring(0, filePath.indexOf("webapp/")) + uploadedFileName);
		} else {
			MultipartFile uploadFile = title;
			UUID uuid = UUID.randomUUID();
			String fileName = title.getOriginalFilename();
			vo.setTitleOriName(fileName);
			fileName = filePath + "title/" + uuid + "_" + fileName;
			vo.setTitleFileName(fileName);
			uploadFile.transferTo(new File(fileName));
			
			File file = new File(filePath.substring(0, filePath.indexOf("resources")) + request.getParameter("titleFileName"));
			file.delete();
		}
		// 파일 처리 끝
		System.out.println("ClsVO : " + vo.toString());

		clsStatusService.updateClass(vo);
		
		rttr.addAttribute("pageNum", crt.getPageNum());
		rttr.addAttribute("amount", crt.getAmount());

		return "redirect:classStat";

	}
	
	@RequestMapping("goBack")
	public String moveList(Criteria crt, RedirectAttributes rttr) {
		
		rttr.addAttribute("pageNum", crt.getPageNum());
		rttr.addAttribute("amount", crt.getAmount());
		
		return "redirect:classStat";
	}

}
