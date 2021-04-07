package com.spring.FitInZip.back.payment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.order.vo.OrderDetailVO;
import com.spring.FitInZip.back.order.vo.OrderVO;
import com.spring.FitInZip.back.payment.vo.PaymentVO;

@Repository
public class ProductPayDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartDTO> getPayPage(String mem_id) {
		return mybatis.selectList("PayDAO.getPayList", mem_id);
	}
	
	//구매내역 payment, pro_order, order_detail 테이블에 insert
	public void productPayFin(PaymentVO pvo , OrderVO ovo, OrderDetailVO dvo) {
		mybatis.insert("PayDAO.insertPayment", pvo);
		mybatis.insert("PayDAO.insertProOrder", ovo);
		mybatis.insert("PayDAO.insertOrderDetail", dvo);
	}
	
	//주문번호 생성용 시퀀스 채번
	public String getOrderSeq() {
		return mybatis.selectOne("PayDAO.propaySequence");
	}
	
	
}
