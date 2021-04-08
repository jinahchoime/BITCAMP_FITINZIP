package com.spring.FitInZip.view.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.member.service.KakaoService;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Controller
@SessionAttributes("member")
public class KakaoController {
	
	@Autowired
	private KakaoService kakaoService; 

	// 카카오가입정보 받기
	@RequestMapping(value="/kakaoLoginCheck")
	@ResponseBody
	public boolean kakaoLoginInfo(String id, Model model){
		
		boolean isJoin = false;
		
		// 일단 카카오로 받은 정보 DB에 있는지 없는지 확인해야함
		System.out.println(">>> - KakaoLoginInfo()");
		MemberVO member = kakaoService.kakaoIsFirst(id);
		
		if (member != null) {
			isJoin = true;
			model.addAttribute("member", member);
		}		
		
		return isJoin;
	}
	
	// 카카오 가입자 기본정보 가지고 추가정보 기입창 ㄱㄱ ㅅㅂ
	@RequestMapping("/kakaoJoinForm")
	public String kakaoAddInfo(MemberVO vo, HttpServletRequest request) {
		System.out.println(">>> - kakaoAddInfo()");
		System.out.println("vo : " + vo);
		
		request.getSession().setAttribute("vo", vo);
		
		return "login/kakaoJoin";
	}
	
	@RequestMapping(value="/kakaoJoin")
	@ResponseBody
	public String kakaoJoin(MemberVO vo, Model model) throws JsonProcessingException {
		System.out.println(">>> - 카카오 추가정보 가지고 insert하러 가자 제발~.~");
		System.out.println("추가정보 입력 후 vo : " + vo);
		
		kakaoService.kakaoJoin(vo);
		kakaoService.welcomeCoupon(vo);
		
		model.addAttribute("member", vo);
		
		return "true";
	}
	
	
}
