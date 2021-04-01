package com.spring.FitInZip.view.trainer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.trainer.TrainerService;
import com.spring.FitInZip.back.trainer.vo.RegisterTrainerDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerCalDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerReviewDTO;



@Controller
@SessionAttributes({"admin", "member", "reqClass", "ingClass", "totalCal", "trainerInfo", "reviewList", "calList"})
public class TrainerController {
	private static final Logger logger = LoggerFactory.getLogger(TrainerController.class);

	@Autowired
	private TrainerService trainerService;

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
	
	@RequestMapping(value = "registerForm/idCheck", method= RequestMethod.GET)
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
	//강사 등록하기 성공 시 이동 페이지
	/*
	 * @RequestMapping(value = "/success") public String home(Locale locale, Model
	 * model) throws Exception {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * logger.debug("Welcome home! The client locale is {}.", locale);
	 * 
	 * return "trainer/trainerLogin"; }
	 */
		
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
    @RequestMapping("/myClass") 
    public String myPage(MemberVO vo) {
    	return "trainer/myClass";
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
		//1. 세션초기화(세션객체를 종료)
		session.invalidate(); //현재 사용중인 세션을 무효화처리
		
		//2. 화면 네비게이션(로그인페이지)
		return "main";
	}
	  
	  
	
}
