package com.spring.FitInZip.back.member.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.spring.FitInZip.back.member.vo.MemberVO;

public interface KakaoService {

	String kakaoIsFirst(String id) throws JsonProcessingException;
	void kakaoJoin(MemberVO vo);
	
}
