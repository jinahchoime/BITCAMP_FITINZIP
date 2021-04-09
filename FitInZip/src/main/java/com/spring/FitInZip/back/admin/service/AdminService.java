package com.spring.FitInZip.back.admin.service;

import java.util.List;
import java.util.Map;

import com.spring.FitInZip.back.admin.vo.GetChartPeopleData;
import com.spring.FitInZip.back.admin.vo.GetClsCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetClsModalDTO;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.GetSubBBSDataDTO;
import com.spring.FitInZip.back.admin.vo.GetSubBBSPeopleDTO;
import com.spring.FitInZip.back.admin.vo.GetSubChartDataDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.admin.vo.MonthPaymentChartDTO;



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
	Map<String,String> inputData();
	Map<String,String> inputDataTwo();
	List<GetSubChartDataDTO> getSubChartData(String btnParam);
	List<GetSubBBSDataDTO> getSubBBSData(String btnParam);
	List<GetChartPeopleData> getChartPeopleStartOne(String btnParam);
	List<GetChartPeopleData> getChartPeopleStartTwo(String btnParam);
	List<GetChartPeopleData> getChartPeopleOne(String btnParam);
	List<GetChartPeopleData> getChartPeopleTwo(String btnParam);
	List<GetSubBBSPeopleDTO> getChartPeopleBBS(String btnParam);
	
	/*다슬*/
	void insertMap(MapVO vo);
	void updateMap(MapVO vo);
	List<MapVO> getMapList(MapVO vo);
	
}

