package com.spring.FitInZip.back.cls.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;
import com.spring.FitInZip.back.review.dto.ReviewDTO;
import com.spring.FitInZip.back.review.vo.ReviewVO;

@Repository
public class ClsDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	// 클래스 리스트
	public List<ClsListDTO> getClassList(String clsCategory) {
		return mybatis.selectList("ClsDAO.getClassList", clsCategory);
	}
	
	// 진행중 클래스 리스트
	public List<ClsListDTO> getIngList(String clsCategory) {
		return mybatis.selectList("ClsDAO.getIngList", clsCategory);
	}
	
	
	// 클래스 상세 꺼내오기
	public ClsDetailDTO getClassDetail(String clsCode) {
		return mybatis.selectOne("ClsDAO.getClassDetail", clsCode);
		
	}
	
	// 리뷰 가져오기
	public List<ReviewDTO> getReview(String clsCode) {
		return mybatis.selectList("ClsDAO.getReview", clsCode);
	}
	
	// 리뷰  쓰기
	public void insertReview(ReviewDTO dto) {
		mybatis.insert("ClsDAO.insertReview", dto);
	}

	// 찜하기 눌렀는지 안눌렀는지
	public int isWish(Map<String, String> map) {
		return mybatis.selectOne("ClsDAO.isWish", map);
	}
	
	// 찜하기
	public void insertWish(Map<String, String> map) {
		mybatis.insert("ClsDAO.insertWish", map);
	}
	
	// 찜 취소하기
	public void deleteWish(Map<String, String> map) {
		mybatis.delete("ClsDAO.deleteWish", map);
	}
}
