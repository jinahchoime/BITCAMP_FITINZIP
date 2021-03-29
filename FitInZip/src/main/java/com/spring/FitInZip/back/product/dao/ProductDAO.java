package com.spring.FitInZip.back.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.product.vo.ProductVO;

@Repository("productDAO")
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ProductDAO() {
		System.out.println(">> ProductDAO() 객체 생성 ");
	}
	
	//상품 등록
	public void insertProduct(ProductVO vo) {
	}
	
	
	//수정
	public void updateProduct(ProductVO vo) {
		
	}
	
	//삭제
	public void deleteProduct(ProductVO vo) {
		
	}
	
	//상품 전체
	public List<ProductVO> getProductList() {
		System.out.println(">> DAO에서 getProductList()실행");
		
		return mybatis.selectList("ProductDAO.getProductList");
		
	}
}
