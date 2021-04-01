package com.spring.FitInZip.back.mypage.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;
import com.spring.FitInZip.back.mypage.vo.UserCouponDTO;
import com.spring.FitInZip.back.mypage.vo.UserProductDTO;
import com.spring.FitInZip.back.mypage.vo.UserWithdrawalDTO;

@Repository
public class MypageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void updateMember(MemberVO vo) {
		int result = mybatis.update("MypageDAO.updateMember", vo);
		System.out.println("처리 결과 : " + result);
	}
	
	public MemberVO selectMember(MemberVO vo) {
		return mybatis.selectOne("MypageDAO.selectMember", vo);
	}
	
	/*현재 클래스 내역 가져오기*/
	public List<UserClsDTO> nowGetUserCls(UserClsDTO dto){
		return mybatis.selectList("MypageDAO.nowSelectCls", dto);
	}
	
	/*종료 클래스 내역 가져오기*/
	public List<UserClsDTO> endGetUserCls(UserClsDTO dto){
		return mybatis.selectList("MypageDAO.endSelectCls", dto);
	}
	
	/*클래스 입장시 체크인 하기*/
	public void insertCheckIn(UserClsDTO dto) {
		mybatis.insert("MypageDAO.insertCheckIn", dto);
	}
	
	public List<UserClsDTO> getUserWishCls(UserClsDTO dto) {
		return mybatis.selectList("MypageDAO.selectWhishCls", dto);
	}
	
	public void deleteWishCls(UserClsDTO dto) {
		mybatis.delete("MypageDAO.deleteWishCls", dto);
	}
	
	public List<UserCouponDTO> getcouponData(UserCouponDTO dto) {
		return mybatis.selectList("MypageDAO.couponHistory", dto);
	}
	
	public List<UserProductDTO> getproductList(UserProductDTO dto) {
		return mybatis.selectList("MypageDAO.productHistory", dto);
	}
	
	//회원탈퇴시 회원정보 수정 01 - 탈퇴사유가 없는 경우
	public void deleteUserNoReason(UserWithdrawalDTO dto) {
		mybatis.update("MypageDAO.deleteUserNoReason", dto);
	}
	
	//회원탈퇴시 회원정보 수정 02 - 탈퇴사유가 있 경우
	public void deleteUserIsReason(UserWithdrawalDTO dto) {
		mybatis.update("MypageDAO.deleteUserIsReason", dto);
	}
	
}
