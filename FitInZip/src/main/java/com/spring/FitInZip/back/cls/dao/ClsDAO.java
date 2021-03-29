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
	
	// 클래스 전체 리스트
	public List<ClsListDTO> getClassList(){
		System.out.println("getClassList() 실행");
		
		return mybatis.selectList("ClsDAO.getClassList");
	}
	
	// 카테고리별 필터링한 리스트
	public List<ClsListDTO> getClassCategory(String clsCategory){
		System.out.println("getClassCategory() 실행");
		
		return mybatis.selectList("ClsDAO.getClassCategory", clsCategory);
	}
}
