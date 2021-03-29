package com.spring.FitInZip.view.trainer;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.trainer.TrainerService;
import com.spring.FitInZip.back.trainer.vo.RegisterTrainerDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerReviewDTO;



@Controller
@SessionAttributes({"member", "reqClass", "ingClass", "totalCal", "trainerInfo", "reviewList"})
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
		return "trainer/trainerLogin";
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
	
    @RequestMapping(value = "/trainerLogin", method = RequestMethod.POST) 
    @ResponseBody
    public String loginTrainer(RegisterTrainerDTO dto, Model model) throws Exception {
    	System.out.println("trainerCheck!");
    	System.out.println("아이디를내놔라~"+dto.getId());
    	System.out.println("패스워드를내놔라~"+dto.getPassword());
    	RegisterTrainerDTO member = trainerService.loginTrainer(dto); 
    	//System.out.println("컨트롤러~"+vo.getId());
	  
    	System.out.println("member: " + member);
    	String result = "";
    	ObjectMapper mapper = new ObjectMapper();

    	if(member == null) {
    		System.out.println("로그인실패"); 
    		result = "no";
    	}  else if (member.getRole().equals("RL01")) {
    		model.addAttribute("member", member);
    		result = "ok"; 
    	} else if (member.getRole().equals("RL02")) {
    		System.out.println("관리자다~"); 
    		result = "ok";
    	} else {
    		System.out.println("오류"); 
    		result = "error";
    	}
    	return mapper.writeValueAsString(result);
    }
 
    @RequestMapping("/trainerMainPage") 
    public String mainPage(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	System.out.println("mainPage~");
    	
    	System.out.println("메인페이지 dto: " + dto);
  
    	String reqClass = trainerService.mainPage1(dto);
    	System.out.println("Controller reqClass: " + reqClass);
    	model.addAttribute("reqClass", reqClass);
  
    	String ingClass = trainerService.mainPage2(dto);
    	model.addAttribute("ingClass", ingClass);
  
    	String totalCal = trainerService.mainPage3(dto);
    	model.addAttribute("totalCal", totalCal);
    	
    	model.addAttribute("member", dto);    	
    	
    	return "trainer/trainerMainPage"; 
    }	
  
    @RequestMapping("/myClass") 
    public String myPage(MemberVO vo) {
    	return "trainer/myClass";
	}
  
    @RequestMapping(value = "/changeInfo", method = RequestMethod.GET) 
    public String changeInfoView(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	RegisterTrainerDTO info = trainerService.trainerInfo(dto);
    	System.out.println("trainerINFO: " + info);
    	model.addAttribute("trainerInfo", info);
    	
    	return "trainer/changeInfo";
	}
    
    @RequestMapping(value = "/changeInfo", method = RequestMethod.POST) 
    public String changeInfo(@ModelAttribute("member") RegisterTrainerDTO dto, Model model) {
    	
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
    
  
    @RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println(">>>로그아웃 처리");
		//1. 세션초기화(세션객체를 종료)
		session.invalidate(); //현재 사용중인 세션을 무효화처리
		
		//2. 화면 네비게이션(로그인페이지)
		return "main";
	}
	  
	  
	
}
