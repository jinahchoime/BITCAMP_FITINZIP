package com.spring.FitInZip.back.member.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.spring.FitInZip.back.member.service.LoginService;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Service
public class LoginServiceImple implements LoginService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	public LoginServiceImple() {
		System.out.println(">> LoginServiceImple() 객체생성");
	}
	

	@Override
	public String kakaoIsFirst(String id) throws JsonProcessingException {
		System.out.println("kakaoIsFirst");
			String isFirst = memberDAO.kakaoIsFirst(id);
			
			return isFirst;
	}
	

	@Override
	public void joinMember(MemberVO vo) {
		memberDAO.joinMember(vo);
	}


	@Override
	public void kakaoJoin(MemberVO vo) {
		memberDAO.kakaoJoin(vo);
		
	}





	
}
