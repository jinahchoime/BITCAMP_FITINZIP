package com.spring.FitInZip.back.payment.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductPayDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
}
