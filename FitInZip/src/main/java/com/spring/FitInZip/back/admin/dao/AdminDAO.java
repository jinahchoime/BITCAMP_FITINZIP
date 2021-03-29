package com.spring.FitInZip.back.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;

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
}
