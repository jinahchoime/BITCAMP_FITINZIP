package com.spring.FitInZip.back.order.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;
import com.spring.FitInZip.back.order.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	//주문페이지 불러오기
	@Override
	public List<CartDTO> getCartList(String mem_id) {
		return orderDAO.getOrderPage(mem_id);
	}

	
}
