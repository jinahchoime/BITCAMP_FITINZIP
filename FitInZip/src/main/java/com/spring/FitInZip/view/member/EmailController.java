package com.spring.FitInZip.view.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.FitInZip.back.member.service.EmailService;
import com.spring.FitInZip.back.member.vo.MemberVO;


@Controller
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
	
	
}
