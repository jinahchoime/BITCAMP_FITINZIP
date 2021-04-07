package com.spring.FitInZip.back.payment;

import java.util.List;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.common.vo.CouponDetailDTO;
import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;

public interface ProductPayService {

	List<CartDTO> getPayList(String mem_id);

	List<PaymentDTO> couponList(MemberVO vo);
	
	CouponDetailDTO couponDetail(String couponCode);
}

