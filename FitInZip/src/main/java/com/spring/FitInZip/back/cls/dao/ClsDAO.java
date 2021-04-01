package com.spring.FitInZip.back.cls.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;

@Repository
public class ClsDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	// 클래스 전체 리스트
	public List<ClsListDTO> getClassList(String clsCategory){
		return mybatis.selectList("ClsDAO.getClassList", clsCategory);
	}

	public ClsDetailDTO getClassDetail(String clsCode) {
		return mybatis.selectOne("ClsDAO.getClassDetail", clsCode);
		
	}

	
}
