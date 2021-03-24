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

	public void kakaoJoin(MemberVO vo) {
		mybatis.insert("MemberDAO.kakaoJoin", vo);
		
	}
	
}
