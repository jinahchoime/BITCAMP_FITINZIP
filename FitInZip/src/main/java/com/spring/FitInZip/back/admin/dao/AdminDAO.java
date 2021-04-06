package com.spring.FitInZip.back.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.admin.vo.GetClsCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetClsModalDTO;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
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
		System.out.println("여기까진오냐?");
		return mybatis.selectList("AdminDAO.getMemberCheck");
	}
	public List<GetClsCheckDTO> getClsCheck(){
		System.out.println("여기까진오냐?");
		return mybatis.selectList("AdminDAO.getClsCheck");
	}
	
	public List<GetModalDTO> getModalList(String id){
		System.out.println("DAO : " + id);
		return mybatis.selectList("AdminDAO.getModal",id);
	}
	
	public Integer updateTrainer(String id) {
		
		return mybatis.update("AdminDAO.insertTrainer",id);
	}
	
	public Integer rejectTrainer(String id) {
		System.out.println("거절 "+id);
		
		return mybatis.update("AdminDAO.rejectTrainer",id);
	}
	
	public List<GetMemberCheckDTO> getMemberCheckRM(){
		return mybatis.selectList("AdminDAO.getMemberCheckRM");
	}
	
	public List<GetMemberCheckDTO> allListRM(String key){
		System.out.println("DAO 파라미터 값 : " + key);
		return mybatis.selectList("AdminDAO.allListRM",key);
	}
	
	public List<GetClsModalDTO> getClsModalList(String id){
		return mybatis.selectList("AdminDAO.getClsModalList", id);
	}
	
	public Integer approveClsTrainer(String id, String btnId) {
		System.out.println("DAO ID : " + id);
		System.out.println("DAO btnId : "+ btnId);
		Map<String,String> map = new HashMap<String,String>();
		map.put("id",id);
		map.put("btnId", btnId);
		System.out.println(map.toString());
		
		return mybatis.update("AdminDAO.approveClsTrainer",map);
	}
	public List<GetClsCheckDTO> getClsList(){
		return mybatis.selectList("AdminDAO.getClsList");
	}

	public List<GetClsCheckDTO> allListCM(String key){
		System.out.println("DAO key" + key);
		return mybatis.selectList("AdminDAO.allListCM",key);
	}
	
	public List<MonthPaymentChartDTO> monthPaymentChart(){
		return mybatis.selectList("AdminDAO.monthPaymentChart");
	}
	
	public List<MonthPaymentChartDTO> lastMonthPaymentChart(){
		return mybatis.selectList("AdminDAO.lastMonthPaymentChart");
	}
	public List<MemberVO> inputData(){
		return mybatis.selectList("AdminDAO.inputData");
	}
}
