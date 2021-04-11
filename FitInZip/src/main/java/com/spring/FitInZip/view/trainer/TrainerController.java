package com.spring.FitInZip.view.trainer;


import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.spring.FitInZip.back.cls.clsStatus.Criteria;
import com.spring.FitInZip.back.cls.clsStatus.PageDTO;
import com.spring.FitInZip.back.cls.clsStatusService.ClsStatusService;
import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsTrainerDTO;
import com.spring.FitInZip.back.cls.vo.ClsVO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.trainer.TrainerService;
import com.spring.FitInZip.back.trainer.vo.RegisterTrainerDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerCalDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerReviewDTO;

@Controller
@SessionAttributes({ "admin", "member", "trainer", "reqClass", "ingCls", "totalCal", "reviewList", "calList" })
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
		return "trainer/registerTrainerMainPage";
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
	public String registerForm(RegisterTrainerDTO dto, MultipartFile memberOriName) throws Exception {
		System.out.println(">>>>>>>>>>registerForm dto : " + dto);
		
		MultipartFile classUploadFile = null;
	    String filePath = this.getClass().getResource("").getPath(); 
	    filePath = filePath.substring(1, filePath.indexOf(".metadata")) +
	    "FitInZip/src/main/webapp/resources/trainer/img/";
		
	    UUID uuid = null;
		String filename = "";
		/*
		 * String filePath = ""; filePath = "C:/FitInZip_Images/";
		 */
		
		if(memberOriName != null) {
			uuid = UUID.randomUUID();
			filename = memberOriName.getOriginalFilename();
			dto.setMemOriName(filename);
			
			if(filename != null && !filename.equals("")) {
				filename = filePath + "memberOriName/" + uuid + "_" + filename;
				dto.setMemFileName(filename);
				classUploadFile = memberOriName;
				classUploadFile.transferTo(new File(filename));
			}
			
		}
	    
		trainerService.insertTrainer(dto);
		System.out.println("dto.filename: " + dto.getMemFileName());
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
    public Map<String, String> loginTrainer(MemberVO vo, Model model, @RequestParam Map<String, String> info , HttpServletRequest request) throws Exception {
    	System.out.println("trainerCheck!");	
    	
    	Map<String, String> map = new HashMap<String, String>();
    	
    	String mId = info.get("id");
    	String mPwd = info.get("password");
    	System.out.println("mid: " + mId);
    	System.out.println("mpwd: " + mPwd);
    	
    	vo.setId(mId);
    	vo.setPassword(mPwd);
    	
    	
    	MemberVO mvo = trainerService.loginFirst(vo);
    	System.out.println("로그인 mvo: " + mvo);
    	
    	if(mvo == null) {
    		map.put("status", "false");
    		return map;
    	}
    	
    	if(mId.equals(mvo.getId()) && mPwd.equals(mvo.getPassword())) {
	    	if(mvo.getRole().equals("RL01")) {
	    		map.put("status", "trainer");
	    		model.addAttribute("trainer", mvo);
	    		return map;
	    	}
	    	if(mvo.getRole().equals("RL02")) {
	    		map.put("status", "admin");
	    		model.addAttribute("admin", mvo);
	    		return map;
	    	}
    	} else {
    		map.put("status", "fail");
    	}
    	return map;
    }
    
    
    //강사 로그인 시 프로필 사진 여부
    @RequestMapping("/trainerMainPageView") 
    public String mainPageView(RegisterTrainerDTO dto, @ModelAttribute("trainer") MemberVO vo, Model model) {
    	// System.out.println("mvo: " + vo); 
    	dto.setId(vo.getId());
    	
    	RegisterTrainerDTO member = trainerService.loginTrainer(dto);
 
    	System.out.println("member: " + member.getRegStatus());
    	if(member.getRegStatus().equals("RS00")) {
    		return "trainer/errorLogin";
    	}
    	
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
    
    //마이페이지 이동 시 프로필 사진이 있는지 여부
    @RequestMapping("/trainerMainPage")
    @ResponseBody
    public Map<String, String> mainPage(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	// System.out.println("mvo: " + vo); 
    	
    	RegisterTrainerDTO trainerInfo = trainerService.loginTrainer(dto);

    	String profileImg = trainerInfo.getMemFileName();
    	
    	profileImg = profileImg.substring(profileImg.indexOf("resources"));
    	//model.addAttribute("profileImg", profileImg);
    	
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("profileImg", profileImg);

    	return result;
    }
	
    @RequestMapping("/myClass") 
    public String myPageView(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	List<ClsTrainerDTO> edCls = trainerService.myPage2(dto);
    	System.out.println("edCls: " + edCls);
    	for (ClsTrainerDTO cdto2: edCls) {
    		String profileImg = cdto2.getThumbnailFileName();
			
			if(profileImg != null) {
				profileImg = profileImg.substring(profileImg.indexOf("resources"));
				cdto2.setThumbnailFileName(profileImg);
				
			}
		}
    	model.addAttribute("edCls", edCls);

    	return "trainer/myClass";
    }
    
    @RequestMapping("/classData") 
    @ResponseBody
    public List<ClsTrainerDTO> myPage(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	
    	List<ClsTrainerDTO> ingCls = trainerService.myPage1(dto);
    	for (ClsTrainerDTO cdto : ingCls) {
			String code = cdto.getClsCode();
			cdto.setList(trainerService.nameCheck(code));
			String profileImg = cdto.getThumbnailFileName();
			
			if(profileImg != null) {
				profileImg = profileImg.substring(profileImg.indexOf("resources"));
				cdto.setThumbnailFileName(profileImg);
				
			}
		}
    	return ingCls;
	}
    
    //내 정보 수정
    @RequestMapping(value = "/changeInfo", method = RequestMethod.GET) 
    public String changeInfoView(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	RegisterTrainerDTO info = trainerService.trainerInfo(dto);
    	System.out.println("trainerINFO: " + info);
    	String profileImg = info.getMemFileName();
    	
    	if(profileImg != null) {
	    	profileImg = profileImg.substring(profileImg.indexOf("resources"));
	    	model.addAttribute("profileImg", profileImg);
    	}
    	
    	model.addAttribute("trainerInfo", info);
    	
    	System.out.println("멤버.파일네임 : " + dto.getMemFileName());
    	
    	return "trainer/changeInfo";
	}
    
    @RequestMapping(value = "/changeInfo", method = RequestMethod.POST) 
    public String changeInfo(@ModelAttribute("member") RegisterTrainerDTO dto, MultipartFile memberOriName, HttpServletRequest request, RedirectAttributes rttr,
    		String profileOriName, String profileFileName) throws IllegalStateException, IOException {
    	
    	// 파일 처리
	    String filePath = this.getClass().getResource("").getPath(); 
	    filePath = filePath.substring(1, filePath.indexOf(".metadata")) +
	    "FitInZip/src/main/webapp/resources/trainer/img/";
		
		/*
		 * String oriFileName = request.getParameter("profileOriName"); String
		 * uploadedFileName = request.getParameter("profileFileName");
		 */
	    System.out.println("memberOriName.getOriginalFilename(): " + memberOriName.getOriginalFilename());
		if(memberOriName.getOriginalFilename() == null || memberOriName.getOriginalFilename().equals("")) {
			dto.setMemOriName(profileOriName);
			dto.setMemFileName(profileFileName);
			
		} else {
			MultipartFile uploadFile = memberOriName;
			UUID uuid = UUID.randomUUID();
			String fileName = memberOriName.getOriginalFilename();
			dto.setMemOriName(fileName);
			fileName = filePath + "memberOriName/" + uuid + "_" + fileName;
			dto.setMemFileName(fileName);
			uploadFile.transferTo(new File(fileName));
			
			System.out.println("파일 경로 및 이름 : " + profileFileName);
			
			File file = new File(profileFileName);
			file.delete();
		}
    	
    	trainerService.updateInfo1(dto);
    	trainerService.updateInfo2(dto);
    	

    	System.out.println("정보 수정 성공!");
		
    	return "redirect:trainerMainPageView";
	}
    
    //회원탈퇴 요청
    @RequestMapping("/regBreakout")
    public String regBreakoutView() {
    	return "trainer/regBreakout";
    }
    
    
    //내 리뷰 확인
    @RequestMapping("/myReview")
    public String checkReview(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	List<TrainerReviewDTO> list = trainerService.checkReview(dto);
		
    	String profileImg;
    	for (TrainerReviewDTO tdto : list) {
			profileImg = tdto.getMemFileName();
		
			if(profileImg != null) {
				profileImg = profileImg.substring(profileImg.indexOf("resources"));
				tdto.setMemFileName(profileImg);
			}
    	}
    	    	
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
	public String logout(HttpSession session, SessionStatus status, RedirectAttributes rttr) {
		System.out.println(">>>로그아웃 처리");
		// 1. 세션초기화(세션객체를 종료)
		//session.invalidate(); // 현재 사용중인 세션을 무효화처리
		if(!status.isComplete()) {
			status.setComplete();
		}
		// 2. 화면 네비게이션(로그인페이지)
		return "redirect:/";
		
	}
    
    
    
    
    //동현
	@RequestMapping(value = "classStat")
	public String goClassStat(@ModelAttribute("member") RegisterTrainerDTO dto, Criteria crt, Model model) {
		crt.setTrainerId(dto.getId());
		String filePath = this.getClass().getResource("").getPath(); 
		filePath = filePath.substring(1, filePath.indexOf(".metadata")) +
			    "FitInZip/src/main/webapp/resources/classRegister/imgs/";

		List<ClsVO> list = clsStatusService.getList(crt);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("trainerId", dto.getId());
		map.put("classStatus", crt.getClassStatus());
		
		int count = clsStatusService.getTotal(map);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(crt, count)); // 뒤 쪽 매개변수는 총 데이터 개수

		return "trainer/classStatus";
	}

	@RequestMapping(value = "classRegister")
	public String goRegister(Criteria crt, Model model) {
		
		model.addAttribute("pageNum", crt.getPageNum());
		model.addAttribute("amount", crt.getAmount());
		model.addAttribute("classStatus", crt.getClassStatus());
		
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
		
		vo.setTrainerId(dto.getId());
		/* vo.setClsOriName(fileName); */
		vo.setClsCode(classCode);

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

		clsStatusService.updateClass(vo);
		
		rttr.addAttribute("pageNum", crt.getPageNum());
		rttr.addAttribute("amount", crt.getAmount());

		return "redirect:classStat";

	}
	
	@RequestMapping("goBack")
	public String moveList(Criteria crt, RedirectAttributes rttr) {
		
		rttr.addAttribute("pageNum", crt.getPageNum());
		rttr.addAttribute("amount", crt.getAmount());
		rttr.addAttribute("classStatus", crt.getClassStatus());
		
		return "redirect:classStat";
	}

}
