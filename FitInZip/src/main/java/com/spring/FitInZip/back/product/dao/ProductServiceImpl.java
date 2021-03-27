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
	public void insertProduct(ProductVO vo) {
		productDAO.insertProduct(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		productDAO.updateProduct(vo);
	}

	@Override
	public void deleteProduct(ProductVO vo) {
		productDAO.deleteProduct(vo);
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
