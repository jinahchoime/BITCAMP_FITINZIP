package com.spring.fitinzip.back.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fitinzip.back.member.vo.MemberVO;

@Repository
public class MypageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void updateMember(MemberVO vo) {
		mybatis.update("MypageDAO.updateMember", vo);
	}
	
	public MemberVO selectMember(MemberVO vo) {
		return mybatis.selectOne("MypageDAO.selectMember", vo);
	}
	
	
}
