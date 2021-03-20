package com.spring.fitinzip.view.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fitinzip.back.member.MypageService;
import com.spring.fitinzip.back.member.vo.MemberVO;

@Controller
@SessionAttributes("member")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/updateMemberInfo/")
	public String updateMember(@ModelAttribute("member") MemberVO vo) {
		mypageService.updateMember(vo);
		
		return "mypage/";
	}
	
	@RequestMapping("/mypage/")
	public ModelAndView getMember(ModelAndView model, MemberVO vo) {
		MemberVO member = mypageService.getMember(vo);
		model.addObject("member", member);
		model.setViewName("updateMemberInfo/");
		
		return model;
	}
}
