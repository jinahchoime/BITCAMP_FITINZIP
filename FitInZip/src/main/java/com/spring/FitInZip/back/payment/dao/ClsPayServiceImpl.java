package com.spring.FitInZip.back.payment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.FitInZip.back.common.vo.CouponDetailDTO;
import com.spring.FitInZip.back.common.vo.MemCouponVO;
import com.spring.FitInZip.back.common.vo.PaymentDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.payment.ClsPayService;
import com.spring.FitInZip.back.payment.vo.PaymentVO;
import com.spring.FitInZip.back.payment.vo.SelectClsDTO;

@Service
public class ClsPayServiceImpl implements ClsPayService{

	@Autowired
	private ClsPayDAO clsPayDAO;
	
	@Override
	public List<PaymentDTO> couponList(MemberVO vo) {
		return clsPayDAO.couponList(vo);
	}

	@Override
	public CouponDetailDTO couponDetail(String couponCode) {
		return clsPayDAO.couponDetail(couponCode);
	}

	@Override
	public void clsPayment(PaymentVO pvo) {
		clsPayDAO.clsPayment(pvo);
		
	}

	@Override
	public void updateCoupon(MemCouponVO mvo) {
		clsPayDAO.updateCoupon(mvo);
		
	}

	@Override
	public List<SelectClsDTO> searchCls(MemberVO vo) {
		return clsPayDAO.searchCls(vo);
	}

}
