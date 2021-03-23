package com.spring.fitinzip.back.member.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fitinzip.back.member.MypageService;
import com.spring.fitinzip.back.member.vo.MemberVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public void insertMember(MemberVO vo) {
		
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		mypageDAO.updateMember(vo);
	}


	@Override
	public MemberVO getMember(MemberVO vo) {
		return mypageDAO.selectMember(vo);
	}

	

}
