package com.spring.fitinzip.back.calendar.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository()
public class CalendarDAOtest {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CalendarDAOtest() {
		System.out.println("CalendarDAOtest ������ ����");
	}
	
	public void insert(Map<String, String> map) {
		mybatis.insert("test.insertTest", map);
	}
	
}
