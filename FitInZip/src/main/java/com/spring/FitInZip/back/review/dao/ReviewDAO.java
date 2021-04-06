package com.spring.FitInZip.back.review.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.review.dto.ReviewDTO;

@Repository
public class ReviewDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	// 리뷰 갯수 가져오기
	public int countReview(String clsCode) {
		return mybatis.selectOne("ReviewDAO.countReview", clsCode);
	}

	// 리뷰 가져오기
	public List<ReviewDTO> getReview(Map<String, Object> map) {		
		return mybatis.selectList("ReviewDAO.getReview", map);
	}
	
	// 리뷰  쓰기
	public void insertReview(ReviewDTO dto) {
		mybatis.insert("ReviewDAO.insertReview", dto);
	}



}
