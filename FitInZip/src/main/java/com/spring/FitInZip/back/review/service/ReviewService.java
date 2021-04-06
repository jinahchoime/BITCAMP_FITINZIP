package com.spring.FitInZip.back.review.service;

import java.util.List;
import java.util.Map;

import com.spring.FitInZip.back.review.dto.ReviewDTO;

public interface ReviewService {

	int countReview(String clsCode);
	
	List<ReviewDTO> getReview(Map<String, Object> map);
	void insertReview(ReviewDTO dto);
}
