package com.spring.FitInZip.back.member.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.spring.FitInZip.back.member.vo.MemberVO;

public interface LoginService {

	String kakaoIsFirst(String id) throws JsonProcessingException;
	void joinMember(MemberVO vo);
	void kakaoJoin(MemberVO vo);
}
