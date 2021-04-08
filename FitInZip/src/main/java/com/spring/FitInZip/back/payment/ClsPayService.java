package com.spring.FitInZip.back.payment;

import java.util.List;

import com.spring.FitInZip.back.common.vo.CouponDetailDTO;
import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.payment.vo.PaymentVO;

public interface ClsPayService {

	List<PaymentDTO> couponList(MemberVO vo);
	CouponDetailDTO couponDetail(String couponCode);
	public void clsPayment(PaymentVO pvo);

}

