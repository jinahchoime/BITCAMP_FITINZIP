package com.spring.FitInZip.back.product;

import java.util.List;

import com.spring.FitInZip.back.product.vo.ProductVO;

public interface ProductService {
	
	ProductVO getProduct(ProductVO vo);
	List<ProductVO> getProductList();
}
