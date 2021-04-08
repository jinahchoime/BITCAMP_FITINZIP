package com.spring.FitInZip.view.pay;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.order.vo.OrderDetailVO;
import com.spring.FitInZip.back.order.vo.OrderVO;
import com.spring.FitInZip.back.payment.ProductPayService;
import com.spring.FitInZip.back.payment.vo.PaymentVO;


@Controller
@SessionAttributes({"postcode", "detailAddress", "extraAddress", "directMsg"})
public class ProductPayController {
	
	@Autowired 
	private ProductPayService productPayService;
	
	//결제 페이지 가져오기
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
	
	//카카오페이 팝업
	@RequestMapping("/kakaopay")
	public String kakaoPay() {
		return "pay/productKakaoPay";
	}
	
	//신용카드 결제 팝업
	@RequestMapping("/card")
	public String cardPay() {
		return "pay/productCardPay";
	}
	
	//결제완료 화면 
	@RequestMapping("/productPayFin")
	public String productPayFin(PaymentVO pvo, OrderVO ovo, HttpSession session, HttpServletRequest request ) {
		
		String mem_id = ((MemberVO)session.getAttribute("member")).getId();
		
		//주문번호 생성하기
		java.util.Date now = new java.util.Date();
		SimpleDateFormat form = new SimpleDateFormat("yyyyMMdd");		
		String str  = form.format(now);
		
		String key = productPayService.getOrderSeq();
		String orderNum = "S" + str + "_" + key;
		
		//payment
		pvo.setOrderNum(orderNum);
		pvo.setMemId(mem_id);
		pvo.setOriginPrice(Integer.parseInt("" + session.getAttribute("totalPrice")));
		pvo.setPaidPrice(Integer.parseInt("" + session.getAttribute("totalPrice")));
		pvo.setPayMethod("카카오페이");
		
		//pro_order
		ovo.setOrderNum(orderNum);
		ovo.setMemId(mem_id);
		ovo.setTotalPrice(Integer.parseInt("" + session.getAttribute("totalPrice")));
		ovo.setPostcode("" + session.getAttribute("postcode"));
		ovo.setAddress("" + session.getAttribute("address"));
		ovo.setDetailAddress("" + session.getAttribute("detailAddress"));
		ovo.setDirectMsg("" + session.getAttribute("directMsg"));
		
		System.out.println(ovo);
		
		//order_detail 
		List<CartDTO> cartList = productPayService.getPayList(mem_id);
		OrderDetailVO dvo = new OrderDetailVO();
		
		for(CartDTO dto : cartList) {
			dvo.setOrderNum(orderNum);
			dvo.setProNum(dto.getProNum());
			dvo.setAmount(dto.getAmount());
			productPayService.productPayFin(dvo);
		}
		
		productPayService.productPayFin(pvo, ovo);
		
		//주문완료시 장바구니 비우기
		productPayService.deleteCart(mem_id);
		
		return "pay/productPayFin";
		
	}
}















