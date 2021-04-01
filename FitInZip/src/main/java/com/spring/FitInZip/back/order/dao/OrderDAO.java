package com.spring.FitInZip.back.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//주문페이지 불러오기
	public List<CartDTO> getOrderPage(String mem_id) {
		return mybatis.selectList("OrderDAO.getOrderList", mem_id);
	}
	
	
}
