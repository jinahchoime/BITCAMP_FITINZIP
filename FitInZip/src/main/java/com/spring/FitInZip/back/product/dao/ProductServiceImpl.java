package com.spring.FitInZip.back.product.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.product.ProductService;
import com.spring.FitInZip.back.product.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO productDAO;
	
	public ProductServiceImpl() {
		
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return null;
	}

	@Override
	public List<ProductVO> getProductList() {
		return productDAO.getProductList();
		 
	}
	
	
}
