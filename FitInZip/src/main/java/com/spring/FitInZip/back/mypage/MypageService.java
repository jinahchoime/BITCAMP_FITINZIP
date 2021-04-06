package com.spring.FitInZip.back.mypage;

import java.util.List;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;
import com.spring.FitInZip.back.mypage.vo.UserCountDTO;
import com.spring.FitInZip.back.mypage.vo.UserCouponDTO;
import com.spring.FitInZip.back.mypage.vo.UserProductDTO;
import com.spring.FitInZip.back.mypage.vo.UserWithdrawalDTO;

public interface MypageService {
	void insertMember(MemberVO vo);
	void updateMember(MemberVO vo);
	MemberVO getMember(String id);
	
	/*마이페이지 총 클래스 신청수*/
	Integer getCountCls(String id);
	/*마이페이지 참여 성공률 LIST*/
	List<UserCountDTO> getParticipationRate(String id);
	
	/*현재 클래스 내역*/
	List<UserClsDTO> nowGetUserCls(UserClsDTO dto);
	/*종료 클래스 내역*/
	List<UserClsDTO> endGetUserCls(UserClsDTO dto);
	
	/*클래스 입장시 체크인 하기*/
	void insertCheckIn(UserClsDTO dto);
	
	/*찜한 클래스 내역*/
	List<UserClsDTO> getUserWishCls(UserClsDTO dto);
	/*찜한 클래스 지우기*/
	void deleteWishCls(UserClsDTO dto);
	/*클래스 내역 가지고 오기*/
	List<UserCouponDTO> getcouponData(UserCouponDTO dto);
	/*주문조회 내역 가지고 오기*/
	List<UserProductDTO> getproductList(UserProductDTO dto);
	
	/*회원탈퇴 회원 가입상태 수정*/
	void deleteUserNoReason(UserWithdrawalDTO dto);
	void deleteUserIsReason(UserWithdrawalDTO dto);
}
