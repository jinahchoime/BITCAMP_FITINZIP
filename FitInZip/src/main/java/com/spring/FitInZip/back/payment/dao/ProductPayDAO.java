package com.spring.FitInZip.back.payment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.common.vo.CouponDetailDTO;
import com.spring.FitInZip.back.common.vo.CouponInfoVO;
import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Repository
public class ProductPayDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartDTO> getPayPage(String mem_id) {
		return mybatis.selectList("PayDAO.getPayList", mem_id);
	}
	
	//클래스 결제 시 쿠폰 사용
	public List<PaymentDTO> couponList(MemberVO vo) {
		return mybatis.selectList("PayDAO.clsPayment", vo);
	}
	
	//클래스 결제 시 쿠폰 상세내역 (ajax)
	public CouponDetailDTO couponDetail(String couponCode) {
		return mybatis.selectOne("PayDAO.couponDetail", couponCode);
	}
	
}
