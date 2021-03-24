package com.spring.FitInZip.back.product;

import java.util.List;

import com.spring.FitInZip.back.product.vo.ProductVO;

public interface ProductService {
	
	void insertProduct(ProductVO vo);
	void updateProduct(ProductVO vo);
	void deleteProduct(ProductVO vo);
	ProductVO getProduct(ProductVO vo);
	List<ProductVO> getProductList();
}
