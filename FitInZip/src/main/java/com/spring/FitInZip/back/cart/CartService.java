package com.spring.FitInZip.back.cart;

import java.util.List;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;

public interface CartService {

	List<CartDTO> getCartList(CartVO vo);
	void insertCart(CartVO vo);
	void deleteCart(CartVO vo);
}
