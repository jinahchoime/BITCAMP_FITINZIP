package com.spring.FitInZip.back.cart;

import java.util.List;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;

public interface CartService {

	List<CartDTO> getCartList(String mem_id);
	void insertCart(CartVO vo);
	void deleteCart(CartVO vo);
	void deleteAllCart(String mem_id);
	void updateAmount(CartVO vo);
}
