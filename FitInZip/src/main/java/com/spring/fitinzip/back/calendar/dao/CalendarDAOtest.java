package com.spring.fitinzip.back.calendar.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("calendarDAO")
public class CalendarDAOtest {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CalendarDAOtest() {
		System.out.println("CalendarDAOtest 생성자 실행");
	}
	
	public void insert(Map<String, String> map) {
		System.out.println(map);
		mybatis.insert("test.insertTest", map);
	}
	
}
