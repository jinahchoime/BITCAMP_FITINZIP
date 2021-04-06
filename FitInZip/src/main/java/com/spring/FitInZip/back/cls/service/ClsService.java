package com.spring.FitInZip.back.cls.service;

import java.util.List;
import java.util.Map;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;
import com.spring.FitInZip.back.review.dto.ReviewDTO;



public interface ClsService {
	
	List<ClsListDTO> getClassList(String clsCategory);
	List<ClsListDTO> getIngList(String clsCategory);
	ClsDetailDTO getClassDetail(String clsCode);
	
	int isWish(Map<String, String> map);
	
	void insertWish(Map<String, String> map);
	void deleteWish(Map<String, String> map);
	
}
