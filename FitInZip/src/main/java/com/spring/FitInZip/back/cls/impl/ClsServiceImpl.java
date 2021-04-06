package com.spring.FitInZip.back.cls.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.cls.dao.ClsDAO;
import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;
import com.spring.FitInZip.back.cls.service.ClsService;
import com.spring.FitInZip.back.review.dto.ReviewDTO;
import com.spring.FitInZip.back.review.vo.ReviewVO;

@Service
public class ClsServiceImpl implements ClsService {
	
	@Autowired
	private ClsDAO clsDAO;
	
	@Override
	public List<ClsListDTO> getClassList(String clsCategory) {
		
		List<ClsListDTO> list = clsDAO.getClassList(clsCategory);
	      for (ClsListDTO dto : list) {
	    	  dto.setReminder();
	    }
	      
		return list;
	}

	@Override
	public List<ClsListDTO> getIngList(String clsCategory) {
		
		List<ClsListDTO> list = clsDAO.getIngList(clsCategory);
	      for (ClsListDTO dto : list) {
	    	  dto.setReminder();
	    }
	      
		return list;
	}
	
	
	
	@Override
	public ClsDetailDTO getClassDetail(String clsCode) {
		
		ClsDetailDTO dto = clsDAO.getClassDetail(clsCode);
	    dto.setReminder();
	  
		return dto;
		
	}

	

	@Override
	public int isWish(Map<String, String> map) {
		return clsDAO.isWish(map);
	}


	// 여기부터 찜 클래스 관련

	@Override
	public void insertWish(Map<String, String> map) {
		clsDAO.insertWish(map);		
	}

	

	@Override
	public void deleteWish(Map<String, String> map) {
		clsDAO.deleteWish(map);		
	}


	
	
	
	
	
}
