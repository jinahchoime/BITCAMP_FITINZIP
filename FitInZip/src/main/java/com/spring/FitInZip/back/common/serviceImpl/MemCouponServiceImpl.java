package com.spring.FitInZip.back.common.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.common.dao.MemCouponDAO;
import com.spring.FitInZip.back.common.service.MemCouponService;
import com.spring.FitInZip.back.common.vo.MemCouponVO;

@Service
public class MemCouponServiceImpl implements MemCouponService {
	@Autowired
	private MemCouponDAO memCouponDAO;
	
	@Override
	public int memCouponInsert(MemCouponVO vo) {
		return memCouponDAO.insertMemCoupon(vo);
	}
	
}
