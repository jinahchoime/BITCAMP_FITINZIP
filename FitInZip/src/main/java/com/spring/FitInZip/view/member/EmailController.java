package com.spring.FitInZip.view.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.member.service.EmailService;
import com.spring.FitInZip.back.member.vo.MemberVO;


@Controller
@SessionAttributes("mvo")
public class EmailController {
	
	@Autowired
	private EmailService emailService; 

	// 메인 로그인 화면
	@RequestMapping("/loginMain")
	public String loginMain() {
		System.out.println("loginMain 실행중");
		
		return "login/loginForm";
	}
	
	
	@RequestMapping("/emailJoinForm")
	public String emailJoinForm(MemberVO vo) {
		System.out.println("emailJoinForm 실행중");
		
		
		return "login/emailJoinForm";
	}
	
	@RequestMapping("/emailJoin")
	@ResponseBody
	public String emailJoin(MemberVO vo) {
		System.out.println("emailJoin 실행중");
		System.out.println("이메일가입 정보 입력 후 vo : " + vo);
		
		emailService.emailJoin(vo);
		return "true";
	}
	
	@RequestMapping("/emailLoginCheck")
	@ResponseBody
	public boolean emailLogin(MemberVO vo, Model model) {
		
		boolean isJoin = false;
		
		System.out.println("emailLogin 실행중");
		System.out.println("입력한 이메일 정보 : " + vo);
	
		MemberVO mvo = emailService.emailLogin(vo);
		System.out.println("로그인 후 받아온 정보 : " + mvo);
		
		if (mvo != null && mvo.getWithdrawal().equals("WD00") && mvo.getRole().equals("RL00")) {
			isJoin = true;
			model.addAttribute("mvo" ,mvo);
		}
		
		
		System.out.println(isJoin);
		ObjectMapper mapper = new ObjectMapper();
		
		
		return isJoin;
	}
	
	
	
	
}
