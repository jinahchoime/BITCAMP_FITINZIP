package com.spring.FitInZip.back.member.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.member.dao.MemberDAO;
import com.spring.FitInZip.back.member.service.EmailService;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private MemberDAO memberDAO;
	
	
	@Override
	public int emailCheck(String id) {
		return memberDAO.emailCheck(id);
	}
	
	@Override
	public void emailJoin(MemberVO vo) {
		memberDAO.emailJoin(vo);
	}

	@Override
	public MemberVO emailLogin(MemberVO vo) {
		return memberDAO.emailLogin(vo);
	}

	@Override
	public void welcomeCoupon(MemberVO vo) {
		memberDAO.welcomeCoupon(vo);
	}

	@Override
	public int passwordUpdate(Map<String, String> map) {
		
		System.out.println("서비스임플 : " + map);
		
		return memberDAO.passwordUpdate(map);
	}

	
	

}
