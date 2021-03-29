package com.spring.FitInZip.view.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.FitInZip.back.product.ProductService;
import com.spring.FitInZip.back.product.vo.ProductVO;


@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/product")
	public String getProductList(Model model, ProductVO vo) {
		//System.out.println(">>productService :" + productService);
		
		List<ProductVO> productList = productService.getProductList();
		//System.out.println("productList : " + productList);
		
		model.addAttribute("productList", productList);
		
		return "product/product";
	}
}
