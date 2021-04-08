package com.spring.FitInZip.view.pay;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.common.vo.CouponDetailDTO;
import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.payment.ClsPayService;



@Controller
public class ClsPayController {
	
	@Autowired 
	private ClsPayService clsPayService;
	
	@RequestMapping("/livePTPay")
	public String payView(Model model, HttpSession session) {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		if(vo == null) {
			return "redirect:/loginMain";
		}
		
		ClsDetailDTO detail = (ClsDetailDTO)session.getAttribute("detail");
		System.out.println("detail:" + detail);
		List<PaymentDTO> list = clsPayService.couponList(vo);
		model.addAttribute("cpList", list); 
		System.out.println("cplist: " + list);
		return "pay/livePTPay";
	}
	
	@RequestMapping("/clsPay")
	@ResponseBody
	public CouponDetailDTO clsCoupon(HttpSession session, @RequestParam("selectVal") String couponCode, Model model) {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		ClsDetailDTO detail = (ClsDetailDTO)session.getAttribute("detail");
		
		System.out.println("couponCode: " + couponCode);
		CouponDetailDTO cvo = clsPayService.couponDetail(couponCode);
		Integer totalPrice = detail.getTotalPrice();
		Integer discountPrice = cvo.getDiscountPrice();
		Integer netPrice = totalPrice - discountPrice;
		System.out.println("netPrice: " + netPrice);
		cvo.setFinalPrice(netPrice);
		model.addAttribute("finalInfo", cvo);
		return cvo;
	}
	 
}















