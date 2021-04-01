package com.spring.FitInZip.back.payment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cart.vo.CartDTO;

@Repository
public class ProductPayDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartDTO> getPayPage(String mem_id) {
		return mybatis.selectList("PayDAO.getPayList", mem_id);
	}
}
