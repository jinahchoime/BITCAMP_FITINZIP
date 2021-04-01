package com.spring.FitInZip.back.cart.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.cart.CartService;
import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<CartDTO> getCartList(String mem_id) {
		return cartDAO.getCartList(mem_id);
	}

	//장바구니에 상품 담기
	@Override
	public void insertCart(CartVO vo) {
		cartDAO.insertCart(vo);
		
	}

	//장바구니 상품 선택 삭제
	@Override
	public void deleteCart(CartVO vo) {
		cartDAO.deleteCart(vo);
	}

	@Override
	public void deleteAllCart(String mem_id) {
		cartDAO.deleteAllCart(mem_id);
	}

	@Override
	public void updateAmount(CartVO vo) {
		cartDAO.updateAmount(vo);
	}


	

}
