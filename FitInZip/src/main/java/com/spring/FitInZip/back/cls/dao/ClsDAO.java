package com.spring.FitInZip.back.cls.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cls.dto.ClsListDTO;

@Repository
public class ClsDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public List<ClsListDTO> getClassList(){
		System.out.println("getClassList() 실행");
		
		return mybatis.selectList("ClsDAO.getClassList");
	}
}
