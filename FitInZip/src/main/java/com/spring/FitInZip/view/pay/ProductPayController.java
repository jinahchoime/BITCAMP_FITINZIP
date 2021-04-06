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
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.payment.ProductPayService;


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
	
	
}















