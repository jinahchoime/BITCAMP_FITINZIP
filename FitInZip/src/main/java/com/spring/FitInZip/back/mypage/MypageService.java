package com.spring.FitInZip.back.mypage;

import java.util.List;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;
import com.spring.FitInZip.back.mypage.vo.UserCouponDTO;

public interface MypageService {
	void insertMember(MemberVO vo);
	void updateMember(MemberVO vo);
	MemberVO getMember(MemberVO vo);
	
	/*클래스 내역*/
	List<UserClsDTO> getUserCls(UserClsDTO dto);
	/*찜한 클래스 내역*/
	List<UserClsDTO> getUserWishCls(UserClsDTO dto);
	/*찜한 클래스 지우기*/
	void deleteWishCls(UserClsDTO dto);
	/*클래스 내역 가지고 오기*/
	List<UserCouponDTO> getcouponData(UserCouponDTO dto);
}
