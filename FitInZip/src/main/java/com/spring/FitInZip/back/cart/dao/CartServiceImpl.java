package com.spring.FitInZip.back.cart.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.cart.CartService;
import com.spring.FitInZip.back.cart.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Override
	public List<CartVO> getCart(String mem_id) {
		return null;
	}

	@Override
	public void insertCart(String mem_id) {
		
	}

}
