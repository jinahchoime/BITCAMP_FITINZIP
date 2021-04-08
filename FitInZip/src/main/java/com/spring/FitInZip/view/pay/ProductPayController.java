package com.spring.FitInZip.view.pay;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.common.vo.CouponDetailDTO;
import com.spring.FitInZip.back.common.vo.CouponInfoVO;
import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.payment.ProductPayService;
import com.spring.FitInZip.back.payment.vo.PaymentVO;


@Controller
public class ProductPayController {

	
	@Autowired 
	private ProductPayService productPayService;
	
	
	@RequestMapping("/productPay")
	public String getPayPage(Model model, HttpServletRequest request, HttpSession session ) {
		
		String mem_id = ((MemberVO)session.getAttribute("member")).getId();
		
		List<CartDTO> cartList = productPayService.getPayList(mem_id);
		
		model.addAttribute("cartList", cartList);
		
		String postcode = request.getParameter("postcode");
		String address= request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		String directMsg = request.getParameter("direct");
		
		session.setAttribute("postcode", postcode);
		session.setAttribute("address", address);
		session.setAttribute("detailAddress", detailAddress);
		session.setAttribute("extraAddress", extraAddress);
		session.setAttribute("directMsg", directMsg);
		
		return "pay/productPay";
	}
	
	@RequestMapping("/livePTPay")
	public String payView(Model model, HttpSession session) {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		if(vo == null) {
			return "redirect:/loginMain";
		}
		
		ClsDetailDTO detail = (ClsDetailDTO)session.getAttribute("detail");
		System.out.println("detail:" + detail);
		List<PaymentDTO> list = productPayService.couponList(vo);
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
		CouponDetailDTO cvo = productPayService.couponDetail(couponCode);
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
	
	productPayService.clsPayment(pvo);
	
	System.out.println("결제정보 등록 완료!");
	
	//insert 하고
	return "redirect:movePayResult";
	}
	
	@RequestMapping("/movePayResult")
	public String confirmPaymentView() {
		return "pay/clsPayResult";
	}
	
	
}















