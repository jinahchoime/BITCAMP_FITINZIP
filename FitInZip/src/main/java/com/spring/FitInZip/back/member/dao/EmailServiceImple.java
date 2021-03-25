package com.spring.FitInZip.back.member.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.member.service.EmailService;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Service
public class EmailServiceImple implements EmailService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void emailJoin(MemberVO vo) {
		memberDAO.emailJoin(vo);
	}

}
