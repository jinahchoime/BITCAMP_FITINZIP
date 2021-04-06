package com.spring.FitInZip.back.review.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.review.dao.ReviewDAO;
import com.spring.FitInZip.back.review.dto.ReviewDTO;
import com.spring.FitInZip.back.review.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public int countReview(String clsCode) {
		return reviewDAO.countReview(clsCode);
	}
	
	@Override
	public List<ReviewDTO> getReview(Map<String, Object> map) {
		return reviewDAO.getReview(map);
	}

	@Override
	public void insertReview(ReviewDTO dto) {
		reviewDAO.insertReview(dto);
		
	}

	

}
