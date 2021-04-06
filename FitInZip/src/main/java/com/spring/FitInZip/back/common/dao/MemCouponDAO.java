package com.spring.FitInZip.back.common.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.common.vo.MemCouponVO;

@Repository
public class MemCouponDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertMemCoupon(MemCouponVO vo) {
		return mybatis.insert("coupon.insertMemCoupon", vo);
	}
	
}
