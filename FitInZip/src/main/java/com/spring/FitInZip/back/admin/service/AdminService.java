package com.spring.FitInZip.back.admin.service;

import java.util.List;

import com.spring.FitInZip.back.admin.vo.GetClsCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetClsModalDTO;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.admin.vo.MonthPaymentChartDTO;
import com.spring.FitInZip.back.cls.vo.ClsVO;
import com.spring.FitInZip.back.member.vo.MemberVO;


public interface AdminService {
	/*상희*/
	List<GetMemberCheckDTO> getMemberCheck();
	List<GetClsCheckDTO> getClsCheck();
	List<GetModalDTO> getModalList(String id);
	Integer updateTrainer(String id);
	Integer rejectTrainer(String id);
	List<GetMemberCheckDTO> getMemberCheckRM();
	List<GetMemberCheckDTO> allListRM(String key);
	List<GetClsModalDTO> getClsModalList(String id);
	Integer approveClsTrainer(String id, String btnId);
	List<GetClsCheckDTO> getClsList();
	List<GetClsCheckDTO> allListCM(String key);
	List<MonthPaymentChartDTO> monthPaymentChart();
	List<MonthPaymentChartDTO> lastMonthPaymentChart();
	List<MemberVO> inputData();
	
	/*다슬*/
	void insertMap(MapVO vo);
	void updateMap(MapVO vo);
	List<MapVO> getMapList(MapVO vo);
	
}

