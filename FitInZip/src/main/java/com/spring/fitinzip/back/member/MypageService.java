package com.spring.fitinzip.back.member;

import java.util.List;

import com.spring.fitinzip.back.member.vo.MemberVO;

public interface MypageService {
	void insertMember(MemberVO vo);
	void updateMember(MemberVO vo);
	MemberVO getMember(MemberVO vo);
}
