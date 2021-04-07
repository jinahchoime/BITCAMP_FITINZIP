package com.spring.FitInZip.back.member.service;

import com.spring.FitInZip.back.member.vo.MemberVO;

public interface KakaoService {

	MemberVO kakaoIsFirst(String id);
	void kakaoJoin(MemberVO vo);
	void welcomeCoupon(MemberVO vo);
}
