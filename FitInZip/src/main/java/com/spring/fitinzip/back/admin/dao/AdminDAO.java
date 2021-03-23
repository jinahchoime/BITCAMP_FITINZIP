package com.spring.fitinzip.back.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fitinzip.back.admin.vo.MapVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(MapVO vo) {
		mybatis.insert("AdminDAO.insert", vo);
	}
	
	public void update(MapVO vo) {
		
	}
	
	public MapVO selectMap(MapVO vo) {
		MapVO map = null;
		
		return map;
	}
	
	public void delete(MapVO vo) {
		
	}
	
}
