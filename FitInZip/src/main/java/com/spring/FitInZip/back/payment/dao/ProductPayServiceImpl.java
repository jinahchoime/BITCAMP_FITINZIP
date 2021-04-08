package com.spring.FitInZip.back.payment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.order.vo.OrderDetailVO;
import com.spring.FitInZip.back.order.vo.OrderVO;
import com.spring.FitInZip.back.payment.ProductPayService;
import com.spring.FitInZip.back.payment.vo.OrderDetailDTO;
import com.spring.FitInZip.back.payment.vo.OrderDetailDeliDTO;
import com.spring.FitInZip.back.payment.vo.PaymentVO;

@Service
public class ProductPayServiceImpl implements ProductPayService{

	@Autowired
	private ProductPayDAO productPayDAO;
	
	@Override
	public List<CartDTO> getPayList(String mem_id) {
		return productPayDAO.getPayPage(mem_id);
	}

	@Override
	public void productPayFin(PaymentVO pvo, OrderVO ovo) {
		productPayDAO.productPayFin(pvo, ovo);
		
	}
	
	@Override
	public void productPayFin(OrderDetailVO dvo) {
		productPayDAO.productPayFin(dvo);
		
	}
	
	@Override
	public String getOrderSeq() {
		return productPayDAO.getOrderSeq();
	}

	@Override
	public void deleteCart(String mem_id) {
		productPayDAO.deleteCart(mem_id);
	}

	@Override
	public List<OrderDetailDTO> orderDetail(String orderNum) {
		return productPayDAO.orderDetail(orderNum);
	}

	@Override
	public OrderDetailDeliDTO orderDetailDeli(String orderNum) {
		return productPayDAO.orderDetailDeli(orderNum);
	}

	
}
