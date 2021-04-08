package com.spring.FitInZip.back.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public MemberVO kakaoIsFirst(String id){
		System.out.println("DAO에 넘어온 id : " + id);
		MemberVO mvo = mybatis.selectOne("MemberDAO.kakaoIsfirst", id);
		System.out.println("emailLogin : " + mvo);
		
		return mvo;
	}
	
	public void joinMember(MemberVO vo) {
		System.out.println("DAO에 넘어온 vo : " + vo);
		mybatis.insert("MemberDAO.joinMember", vo);
	}
	
	// 카카오로 가입처리
	public void kakaoJoin(MemberVO vo) {
		mybatis.insert("MemberDAO.kakaoJoin", vo);
	}

	// 이메일 중복검사
	public int emailCheck(String id) {
		System.out.println("다오에 넘어온 id : " + id);
		return mybatis.selectOne("MemberDAO.emailCheck", id);
	}
	
	// 이메일로 가입처리
	public void emailJoin(MemberVO vo) {
		mybatis.insert("MemberDAO.emailJoin", vo);
	}
	
	
	
	// 쿠폰발급
	public void welcomeCoupon(MemberVO vo) {
		mybatis.insert("MemberDAO.welcomeCoupon", vo);
	}

	public MemberVO emailLogin(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.emailLogin", vo);
	}

	public int passwordUpdate(Map<String, String> map) {
		
		System.out.println("다오 : " + map);
		
		return mybatis.update("MemberDAO.passwordUpdate", map);
	}
	
}
