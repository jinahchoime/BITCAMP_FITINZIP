package com.spring.FitInZip.back.payment;

import java.util.List;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.order.vo.OrderDetailVO;
import com.spring.FitInZip.back.order.vo.OrderVO;
import com.spring.FitInZip.back.payment.vo.OrderDetailDTO;
import com.spring.FitInZip.back.payment.vo.OrderDetailDeliDTO;
import com.spring.FitInZip.back.payment.vo.PaymentVO;

public interface ProductPayService {

	List<CartDTO> getPayList(String mem_id);
	void productPayFin(PaymentVO pvo, OrderVO ovo);
	void productPayFin(OrderDetailVO dvo);
	String getOrderSeq();
	void deleteCart(String mem_id);
	List<OrderDetailDTO> orderDetail(String orderNum);
	OrderDetailDeliDTO orderDetailDeli(String orderNum);
}

