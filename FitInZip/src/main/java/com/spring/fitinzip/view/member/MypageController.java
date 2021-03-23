package com.spring.fitinzip.view.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fitinzip.back.member.MypageService;
import com.spring.fitinzip.back.member.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/mypage") 
	public String mypage(MemberVO vo) {
		return "mypage/mypage";
	}
	
	@RequestMapping("/UpdateMypage") 
	public String updateMember(MemberVO vo) {
		System.out.println("updateMember 실행중");
		mypageService.updateMember(vo);
		
		return "redirect:/mypage";
	}
	
	
	@RequestMapping("/updateMemberInfo")
	public String getMember(Model model, MemberVO vo) {
		MemberVO member = mypageService.getMember(vo);
		model.addAttribute("member", member);
		
		System.out.println("member: " + member.toString());
		
		return "mypage/updateMemberInfo";
	}
}
