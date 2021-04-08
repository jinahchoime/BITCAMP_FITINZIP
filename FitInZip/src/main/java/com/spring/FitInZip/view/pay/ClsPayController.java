package com.spring.FitInZip.view.pay;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.common.vo.CouponDetailDTO;
import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.payment.ClsPayService;
import com.spring.FitInZip.back.payment.vo.PaymentVO;



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
		
		//model.addAttribute("finalInfo", cvo);
		session.setAttribute("finalInfo", cvo);
		return cvo;
	}
	
	@RequestMapping("/clsPayConfirm")
	public String confirmPayment(HttpSession session, PaymentVO pvo, RedirectAttributes rttr) {
	MemberVO vo = (MemberVO)session.getAttribute("member");
	ClsDetailDTO detail = (ClsDetailDTO)session.getAttribute("detail");
	CouponDetailDTO dto = (CouponDetailDTO)session.getAttribute("finalInfo");	
	System.out.println("결제완료 후 vo: " + vo);
	System.out.println("결제완료 후 detail: " + detail);
	System.out.println("결제완료 후 dto: " + dto);
	
	Integer paidPrice;
	
	if(dto == null) {
		paidPrice = detail.getTotalPrice();
	} else {
		paidPrice = dto.getFinalPrice();
	}
	System.out.println("paidPrice:" + paidPrice);
	
	Integer originPrice = detail.getTotalPrice();
	double commission = paidPrice * 0.1;
	Integer comm = (int)commission;
	double netPrice = paidPrice * 0.9;
	Integer nprice = (int)netPrice;
	
	pvo.setMemId(vo.getId());
	pvo.setClsCode(detail.getClsCode());
	pvo.setOriginPrice(originPrice);
	pvo.setPaidPrice(paidPrice);
	pvo.setCommission(comm);
	pvo.setNetPrice(nprice);
	
	clsPayService.clsPayment(pvo);
	
	System.out.println("결제정보 등록 완료!");
	
	//insert 하고
	return "redirect:movePayResult";
	}
	
	@RequestMapping("/movePayResult")
	public String confirmPaymentView() {
		return "pay/clsPayResult";
	}
	 
}















