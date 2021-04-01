package com.spring.FitInZip.back.payment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.payment.ProductPayService;

@Service
public class ProductPayServiceImpl implements ProductPayService{

	@Autowired
	private ProductPayDAO productPayDAO;
	
	@Override
	public List<CartDTO> getPayList(String mem_id) {
		return productPayDAO.getPayPage(mem_id);
	}
	
}
