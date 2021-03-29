package com.spring.FitInZip.view.mypage;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FitInZip.back.mypage.MypageService;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.cls.vo.ClsVO;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	/*마이페이지로*/
	@RequestMapping("/mypage")
	public String mypage(HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member == null) {
			return "redirect:/loginMain";
		}
		
		return "mypage/mypage";
	}
	
	/*클래스 내역 페이지로*/
	@RequestMapping("/clsHistory")
	public String clsHistory() {
		return "mypage/clsHistory";
	}
	
	/*클래스 history 내역 ajax로 뿌리기*/
	@RequestMapping("/clsdata") 
	@ResponseBody
	public List<UserClsDTO> clsData(UserClsDTO dto, HttpSession session) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		
		return mypageService.getUserCls(dto);
		
	}
	
	/*찜한내역 페이지로*/
	@RequestMapping("/clsHeart")
	public String clsHeart() {
		return "mypage/clsHeart";
	}
	
	/*찜한내역 ajax로 뿌리기*/
	@RequestMapping("/clsHeartData") 
	@ResponseBody
	public List<UserClsDTO> clsHeartData(UserClsDTO dto, HttpSession session) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		
		return mypageService.getUserWishCls(dto);
		
	}
	
	/*쿠폰내역 페이지로*/
	@RequestMapping("/couponHistory")
	public String couponHistory() {
		return "mypage/couponHistory";
	}
	
	/*주문조회 페이지로*/
	@RequestMapping("/productHistory")
	public String productHistory() {
		return "mypage/productHistory";
	}
	
	/*회원수정 페이지로*/
	@RequestMapping("/updateMemberInfo")
	public String getMember() {
		return "mypage/updateMemberInfo";
	}
	
	/*회원수정 처리*/
	@RequestMapping("/UpdateMypage") 
	public String updateMember(MemberVO vo, HttpServletRequest request, HttpSession session) {
		System.out.println("updateMember 실행");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		System.out.println("updateMember id : " + member.getId());
		System.out.println("updateMember pw : " + member.getPassword());
		
		vo.setId(member.getId());
		vo.setPassword(member.getPassword());
		
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
	
	
	
	/*회원탈퇴 페이지로*/
	@RequestMapping("/withdrawal")
	public String withdrawal() {
		return "mypage/withdrawal";
	}
	
}
