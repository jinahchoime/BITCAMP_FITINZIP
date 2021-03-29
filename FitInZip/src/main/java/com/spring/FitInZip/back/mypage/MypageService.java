package com.spring.FitInZip.back.mypage;

import java.util.List;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;

public interface MypageService {
	void insertMember(MemberVO vo);
	void updateMember(MemberVO vo);
	MemberVO getMember(MemberVO vo);
	
	/*클래스 내역*/
	List<UserClsDTO> getUserCls(UserClsDTO dto);
	/*찜한 클래스 내역*/
	List<UserClsDTO> getUserWishCls(UserClsDTO dto);
}
