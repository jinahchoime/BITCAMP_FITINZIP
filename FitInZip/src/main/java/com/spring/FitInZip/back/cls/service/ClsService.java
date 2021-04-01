package com.spring.FitInZip.back.cls.service;

import java.util.List;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;
import com.spring.FitInZip.back.review.dto.ReviewDTO;
import com.spring.FitInZip.back.review.vo.ReviewVO;



public interface ClsService {
	
	List<ClsListDTO> getClassList(String clsCategory);
	ClsDetailDTO getClassDetail(String clsCode);
	List<ReviewDTO> getReview(String clsCode);
}
