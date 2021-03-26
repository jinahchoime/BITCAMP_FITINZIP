package com.spring.FitInZip.back.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public String kakaoIsFirst(String id) throws JsonProcessingException {
		System.out.println("DAO에 넘어온 id : " + id);
		String isFirst = mybatis.selectOne("MemberDAO.kakaoIsfirst", id);
		
		System.out.println("isFirst : " + isFirst);
		return isFirst;
	}
	
	public void joinMember(MemberVO vo) {
		System.out.println("DAO에 넘어온 vo : " + vo);
		mybatis.insert("MemberDAO.joinMember", vo);
	}
	
	// 카카오로 가입처리
	public void kakaoJoin(MemberVO vo) {
		mybatis.insert("MemberDAO.join", vo);
		
	}

	// 이메일로 가입처리
	public void emailJoin(MemberVO vo) {
		mybatis.insert("MemberDAO.emailJoin", vo);
		
	}

	public MemberVO emailLogin(MemberVO vo) {
		System.out.println("===> emailLogin() 실행");
		
		MemberVO mvo = mybatis.selectOne("MemberDAO.emailLogin", vo);
		System.out.println("emailLogin : " + mvo);
		
		return mvo;
		
	}
	
}
