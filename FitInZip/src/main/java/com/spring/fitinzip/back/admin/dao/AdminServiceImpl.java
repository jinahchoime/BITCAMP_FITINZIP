package com.spring.fitinzip.back.admin.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fitinzip.back.admin.AdminService;
import com.spring.fitinzip.back.admin.vo.MapVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public void insertMap(MapVO vo) {
		adminDAO.insert(vo);
	}

	@Override
	public void updateMap(MapVO vo) {
		adminDAO.update(vo);
	}

	@Override
	public MapVO getMap(MapVO vo) {
		MapVO map = adminDAO.selectMap(vo); 
		return map;
	}

}
