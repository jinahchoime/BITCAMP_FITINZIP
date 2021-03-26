package com.spring.FitInZip.view.mypage;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FitInZip.back.mypage.MypageService;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/mypage") 
	public String mypage(MemberVO vo) {
		return "mypage/mypage";
	}
	
	@RequestMapping("/clsHistory") 
	public String clsHistory(MemberVO vo) {
		return "mypage/clsHistory";
	}
	
	@RequestMapping("/UpdateMypage") 
	public String updateMember(MemberVO vo, HttpServletRequest request) {
		System.out.println("updateMember ������");
		
		String month = request.getParameter("month");
		if(month.length() == 1) {
			month = "0" + month;
		}
		
		String day = request.getParameter("day");
		if(day.length() == 1) {
			day = "0" + day;
		}
		
		String birth = request.getParameter("year") + month + day;
		System.out.println("birth : " + birth);
		vo.setBirth(birth);
		
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
