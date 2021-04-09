package com.spring.FitInZip.back.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.admin.vo.GetChartPeopleData;
import com.spring.FitInZip.back.admin.vo.GetClsCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetClsModalDTO;
import com.spring.FitInZip.back.admin.vo.GetInputData;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.GetSubBBSDataDTO;
import com.spring.FitInZip.back.admin.vo.GetSubBBSPeopleDTO;
import com.spring.FitInZip.back.admin.vo.GetSubChartDataDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.admin.vo.MonthPaymentChartDTO;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*다슬*/
	public void insert(MapVO vo) {
		mybatis.insert("AdminDAO.insert", vo);
	}
	
	public void update(MapVO vo) {
		
	}

	public List<MapVO> selectMap(MapVO vo) {
		return mybatis.selectList("AdminDAO.select", vo);
	}
	
	
	/*상희*/
	public List<GetMemberCheckDTO> getMemberCheck(){
		return mybatis.selectList("AdminDAO.getMemberCheck");
	}
	public List<GetClsCheckDTO> getClsCheck(){
		return mybatis.selectList("AdminDAO.getClsCheck");
	}
	
	public List<GetModalDTO> getModalList(String id){
		return mybatis.selectList("AdminDAO.getModal",id);
	}
	
	public Integer updateTrainer(String id) {
		
		return mybatis.update("AdminDAO.insertTrainer",id);
	}
	
	public Integer rejectTrainer(String id) {
		return mybatis.update("AdminDAO.rejectTrainer",id);
	}
	
	public List<GetMemberCheckDTO> getMemberCheckRM(){
		return mybatis.selectList("AdminDAO.getMemberCheckRM");
	}
	
	public List<GetMemberCheckDTO> allListRM(String key){
		return mybatis.selectList("AdminDAO.allListRM",key);
	}
	
	public List<GetClsModalDTO> getClsModalList(String id){
		return mybatis.selectList("AdminDAO.getClsModalList", id);
	}
	
	public Integer approveClsTrainer(String id, String btnId) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id",id);
		map.put("btnId", btnId);
		return mybatis.update("AdminDAO.approveClsTrainer",map);
	}
	public List<GetClsCheckDTO> getClsList(){
		return mybatis.selectList("AdminDAO.getClsList");
	}

	public List<GetClsCheckDTO> allListCM(String key){
		return mybatis.selectList("AdminDAO.allListCM",key);
	}
	
	public List<MonthPaymentChartDTO> monthPaymentChart(){
		return mybatis.selectList("AdminDAO.monthPaymentChart");
	}
	
	public List<MonthPaymentChartDTO> lastMonthPaymentChart(){
		return mybatis.selectList("AdminDAO.lastMonthPaymentChart");
	}
	public List<GetInputData> inputData(){
		return mybatis.selectList("AdminDAO.inputData");
	}
	public List<GetInputData> inputDataTwo(){
		return mybatis.selectList("AdminDAO.inputDataTwo");
	}
	public List<GetSubChartDataDTO> getSubChartData(String btnParam){
		return mybatis.selectList("AdminDAO.getChageChartData",btnParam);
	}
	public List<GetSubBBSDataDTO> getSubBBSData(String btnParam){
		List<GetSubBBSDataDTO> list= mybatis.selectList("AdminDAO.getSubMainBBS",btnParam);

		return list;
	}
	public List<GetChartPeopleData> getChartPeopleStartOne(String btnParam){
		return mybatis.selectList("AdminDAO.getChartPeopleStartOne",btnParam);
	}
	public List<GetChartPeopleData> getChartPeopleStartTwo(String btnParam){
		return mybatis.selectList("AdminDAO.getChartPeopleStartTwo",btnParam);
	}
	public List<GetChartPeopleData> getChartPeopleOne(String btnParam){
		return mybatis.selectList("AdminDAO.getChartPeopleOne",btnParam);
	}
	public List<GetChartPeopleData> getChartPeopleTwo(String btnParam){
		return mybatis.selectList("AdminDAO.getChartPeopleTwo",btnParam);
	}
	public List<GetSubBBSPeopleDTO> getChartPeopleBBS(String btnParam){
		return mybatis.selectList("AdminDAO.getChartPeopleBBS",btnParam);
	}
}
