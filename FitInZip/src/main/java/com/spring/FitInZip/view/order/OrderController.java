package com.spring.FitInZip.view.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.order.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/order")
	public String getOrderPage(Model model, CartVO vo, CartDTO dto, MemberVO member) {
		
		List<CartDTO> cartList = orderService.getCartList(vo);		
		model.addAttribute("cartList", cartList);
		orderService.getCartList(vo);
		return "order/order";
	}
	
}

