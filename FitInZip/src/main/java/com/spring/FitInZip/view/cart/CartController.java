package com.spring.FitInZip.view.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.FitInZip.back.cart.CartService;
import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	//장바구니 불러오기
	@RequestMapping("/cart")
	public String getCartList(Model model, CartVO vo, CartDTO dto, HttpSession session) {
		
	
		if (session.getAttribute("member") == null) {
			return "redirect:/loginMain";
		} 

		String mem_id =((MemberVO)session.getAttribute("member")).getId();
		
		List<CartDTO> cartList = cartService.getCartList(mem_id);
		
		model.addAttribute("cartList", cartList);
		
		return "cart/cart";
	}
	
	//카트 담기
	@ResponseBody
	@RequestMapping(value="/insertCart", method= RequestMethod.POST)
	public String insertCart(CartVO vo, HttpSession session, HttpServletRequest request) {
		
		String mem_id =((MemberVO)session.getAttribute("member")).getId();
		
		vo.setMemId(mem_id);
		
		boolean isExist = findProduct(request.getParameter("proNum"), session);
		
		//같은 상품 있으면 수량변경 해주기 
		if (isExist == true) {
			System.out.println("장바구니 중복");
			return "redirect:/product";
		} else {
			cartService.insertCart(vo);
		}
		return "true";
		
	}
	
	//장바구니에 상품 있는지 확인 //중복 담기 처리용
	public boolean findProduct(String proNum, HttpSession session) {
		
		String mem_id =((MemberVO)session.getAttribute("member")).getId();
		
		List<CartDTO> list = cartService.getCartList(mem_id);
		
		boolean isExist = false;
		
		
		for (CartDTO cartList : list) {
			//System.out.println("cartList:" + cartList);
			if(cartList.getProNum().equals(proNum)) {
				isExist = true; //같은 상품 들어있음
			}
		}
		
		return isExist;
	}
	
	//장바구니에서 상품 선택 삭제
	@RequestMapping(value="/deleteCart", method= RequestMethod.POST)
	public String deleteCart(Model model, CartVO vo, HttpServletRequest request) {
		
		System.out.println("dddd :" + request.getParameter("cartCode"));
		
		cartService.deleteCart(vo);
		
		return "redirect:/cart";
	}
	
	//장바구니 상품 전체 삭제
	@RequestMapping("deleteAllCart")
	public String deleteAllCart(HttpSession session) {
		
		String mem_id =((MemberVO)session.getAttribute("member")).getId();
		cartService.deleteAllCart(mem_id);
		
		return "redirect:/cart";
	}
	
	//상품 수량 변경
	//up
	@ResponseBody
	@RequestMapping(value="/updateAmount", method= RequestMethod.POST)
	public String updateAmount(CartVO vo) {
		
		System.out.println("vo:" + vo.toString());
		
		cartService.updateAmount(vo);
		
		return "redirect:/cart";
	}
	
	//down
	@ResponseBody
	@RequestMapping(value="/downAmount", method= RequestMethod.POST)
	public String downAmount(CartVO vo) {
		cartService.downAmount(vo);
		return "redirect:/cart";
	}
}









