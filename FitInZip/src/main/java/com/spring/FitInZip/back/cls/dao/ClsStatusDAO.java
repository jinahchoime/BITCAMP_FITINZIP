package com.spring.FitInZip.back.cls.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cls.clsStatus.Criteria;
import com.spring.FitInZip.back.cls.vo.ClsVO;

@Repository
public class ClsStatusDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ClsVO> getListWithPaging(Criteria crt) {
		
		List<ClsVO> list = mybatis.selectList("class.getListWithPaging", crt);
		
		return list;
	}
	
}
