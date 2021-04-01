package com.spring.FitInZip.back.mypage.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.mypage.MypageService;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;
import com.spring.FitInZip.back.mypage.vo.UserCouponDTO;
import com.spring.FitInZip.back.mypage.vo.UserProductDTO;
import com.spring.FitInZip.back.mypage.vo.UserWithdrawalDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public void insertMember(MemberVO vo) {
		
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		mypageDAO.updateMember(vo);
	}


	@Override
	public MemberVO getMember(MemberVO vo) {
		return mypageDAO.selectMember(vo);
	}

	@Override
	public List<UserClsDTO> nowGetUserCls(UserClsDTO dto) {
		return mypageDAO.nowGetUserCls(dto);
	}
	

	@Override
	public List<UserClsDTO> endGetUserCls(UserClsDTO dto) {
		return mypageDAO.endGetUserCls(dto);
	}

	@Override
	public void insertCheckIn(UserClsDTO dto) {
		mypageDAO.insertCheckIn(dto);
		
	}

	@Override
	public List<UserClsDTO> getUserWishCls(UserClsDTO dto) {
		return mypageDAO.getUserWishCls(dto);
	}

	@Override
	public void deleteWishCls(UserClsDTO dto) {
		mypageDAO.deleteWishCls(dto);
		
	}

	@Override
	public List<UserCouponDTO> getcouponData(UserCouponDTO dto) {
		return mypageDAO.getcouponData(dto);
	}

	@Override
	public List<UserProductDTO> getproductList(UserProductDTO dto) {
		return mypageDAO.getproductList(dto);
	}

	@Override
	public void deleteUserNoReason(UserWithdrawalDTO dto) {
		 mypageDAO.deleteUserIsReason(dto);
		
	}

	@Override
	public void deleteUserIsReason(UserWithdrawalDTO dto) {
		 mypageDAO.deleteUserIsReason(dto);
		
	}
	

}
