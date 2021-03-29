package com.spring.FitInZip.back.mypage.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;
import com.spring.FitInZip.back.mypage.vo.UserCouponDTO;

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
	
	public List<UserClsDTO> getUserClsList(UserClsDTO dto){
		return mybatis.selectList("MypageDAO.selectCls", dto);
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
	
}
