package com.spring.FitInZip.back.mypage;

import java.util.List;

import com.spring.FitInZip.back.member.vo.MemberVO;

public interface MypageService {
	void insertMember(MemberVO vo);
	void updateMember(MemberVO vo);
	MemberVO getMember(MemberVO vo);
}
