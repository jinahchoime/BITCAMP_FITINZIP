package com.spring.FitInZip.back.payment;

import java.util.List;

import com.spring.FitInZip.back.payment.vo.ClsCalDTO;
import com.spring.FitInZip.back.common.vo.CouponDetailDTO;
import com.spring.FitInZip.back.common.vo.MemCouponVO;
import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.payment.vo.PaymentVO;
import com.spring.FitInZip.back.payment.vo.SelectClsDTO;

public interface ClsPayService {

	List<PaymentDTO> couponList(MemberVO vo);
	CouponDetailDTO couponDetail(String couponCode);
	public void clsPayment(PaymentVO pvo);
	public void updateCoupon(MemCouponVO mvo);
	List<SelectClsDTO> searchCls(MemberVO vo);
	public void updateCal(ClsCalDTO cdto);

}

