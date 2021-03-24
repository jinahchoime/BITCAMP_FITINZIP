package com.spring.FitInZip.back.cart;

import java.util.List;

import com.spring.FitInZip.back.cart.vo.CartVO;

public interface CartService {

	void insertCart(String mem_id);
	List<CartVO> getCart(String mem_id);
}
