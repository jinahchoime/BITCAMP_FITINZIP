package com.spring.FitInZip.back.admin.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.admin.AdminService;
import com.spring.FitInZip.back.admin.vo.MapVO;

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
	public List<MapVO> getMapList(MapVO vo) {
		List<MapVO> maplist = adminDAO.selectMap(vo); 
		
		return maplist;
	}

}
