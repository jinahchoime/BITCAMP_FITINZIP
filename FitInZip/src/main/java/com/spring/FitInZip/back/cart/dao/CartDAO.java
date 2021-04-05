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
	public List<CartDTO> getCartList(String mem_id) {
		return mybatis.selectList("CartDAO.getCartList", mem_id);
	}
	
	//장바구니에 물건 담기
	public void insertCart(CartVO vo) {
		mybatis.insert("CartDAO.insertCart", vo);
	}
	
	//장바구니에서 상품 선택 삭제
	public void deleteCart(CartVO vo) {
		mybatis.delete("CartDAO.deleteCart", vo);
	}
	
	//장바구니 상품 전체 삭제
	public void deleteAllCart(String mem_id) {
		mybatis.delete("CartDAO.deleteAllCart", mem_id);
	}
	
	//장바구니 상품 수량 변경
	public void updateAmount(CartVO vo) {
		mybatis.update("CartDAO.updateAmount", vo);
	}
	
	public void downAmount(CartVO vo) {
		mybatis.update("CartDAO.downAmount", vo);
	}
}
