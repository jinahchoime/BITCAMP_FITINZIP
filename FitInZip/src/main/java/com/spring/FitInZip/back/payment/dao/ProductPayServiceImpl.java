package com.spring.FitInZip.back.payment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.common.vo.CouponDetailDTO;

import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.payment.ProductPayService;
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
	public List<PaymentDTO> couponList(MemberVO vo) {
		return productPayDAO.couponList(vo);
	}

	@Override
	public CouponDetailDTO couponDetail(String couponCode) {
		return productPayDAO.couponDetail(couponCode);
	}

	@Override
	public void clsPayment(PaymentVO pvo) {
		productPayDAO.clsPayment(pvo);
		
	}

	
	
}
