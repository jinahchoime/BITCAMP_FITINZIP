package com.spring.FitInZip.back.member.service;

import java.util.Map;

import com.spring.FitInZip.back.member.vo.MemberVO;

public interface EmailService {
	
	int emailCheck(String id);
	
	void emailJoin(MemberVO vo);
	MemberVO emailLogin(MemberVO vo);
	void welcomeCoupon(MemberVO vo);
	int passwordUpdate(Map<String, String> map);
	
}
