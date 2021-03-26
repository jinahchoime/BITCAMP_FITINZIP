package com.spring.FitInZip.back.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.spring.FitInZip.back.member.dao.MemberDAO;
import com.spring.FitInZip.back.member.service.KakaoService;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Service
public class KakaoServiceImple implements KakaoService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	public KakaoServiceImple() {
		System.out.println(">> KakaoServiceImple() 객체생성");
	}
	
	// 카카오 이미 로그인했는지 아닌지
	@Override
	public MemberVO kakaoIsFirst(String id){
		System.out.println("kakaoIsFirst");
		
		return memberDAO.kakaoIsFirst(id);
	}
	
	// 카카오 최초 로그인시 가입처리
	@Override
	public void kakaoJoin(MemberVO vo) {
		memberDAO.kakaoJoin(vo);
		
	}
	
}
