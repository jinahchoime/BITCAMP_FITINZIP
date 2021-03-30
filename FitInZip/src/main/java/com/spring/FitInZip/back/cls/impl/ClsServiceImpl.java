package com.spring.FitInZip.back.cls.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.cls.dao.ClsDAO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;
import com.spring.FitInZip.back.cls.service.ClsService;

@Service
public class ClsServiceImpl implements ClsService {
	
	@Autowired
	private ClsDAO clsDAO;

	@Override
	public List<ClsListDTO> getClassList(String clsCategory) {
		
		return clsDAO.getClassList(clsCategory);
	}
/*
	@Override
	public List<ClsListDTO> getClassCategory(String clsCategory) {
		// TODO Auto-generated method stub
		return clsDAO.getClassCategory(clsCategory);
	}
*/
}
