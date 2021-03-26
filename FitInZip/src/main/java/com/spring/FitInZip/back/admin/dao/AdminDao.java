package com.spring.FitInZip.back.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<GetMemberCheckDTO> getMemberCheck(){
		System.out.println("여기까진오냐?");
		return mybatis.selectList("admin.getMemberCheck");
	}
	
	public List<GetModalDTO> getModalList(String id){
		System.out.println("DAO : " + id);
		return mybatis.selectList("admin.getModal",id);
	}
}
