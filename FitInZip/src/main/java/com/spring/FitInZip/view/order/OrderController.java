package com.spring.FitInZip.view.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.order.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	//주문결제 중 배송 페이지 로딩
	@RequestMapping("/order")
	public String getOrderPage(Model model,CartDTO dto, HttpSession session) {
		
		String mem_id =((MemberVO)session.getAttribute("member")).getId();
		
		List<CartDTO> cartList = orderService.getCartList(mem_id);		
		
		model.addAttribute("cartList", cartList);
		return "order/order";
	}
	
	@RequestMapping(value="/insertOrder", method= RequestMethod.POST)
	public String insertOrder() {
		return null;
	}
	
}

