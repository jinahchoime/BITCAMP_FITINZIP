package com.spring.FitInZip.back.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//장바구니 불러오기
	public List<CartDTO> getCartList(CartVO vo) {
		System.out.println("asdasdsa "+vo.getMemId());
		return mybatis.selectList("CartDAO.getCartList", vo);
	}
	
	//장바구니에 물건 담기
	public void insertCart(CartVO vo) {
		mybatis.insert("CartDAO.insertCart", vo);
	}
	
	//장바구니에서 상품 선택 삭제
	public void deleteCart(CartVO vo) {
		mybatis.delete("CartDAO.deleteCart", vo);
	}
}
