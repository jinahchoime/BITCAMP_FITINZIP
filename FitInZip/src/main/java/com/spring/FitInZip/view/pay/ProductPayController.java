package com.spring.FitInZip.view.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.FitInZip.back.payment.ProductPayService;

@Controller
public class ProductPayController {

	/*
	 * @Autowired private ProductPayService productPayService;
	 */
	
	@RequestMapping("/productPay")
	public String getOrder() {
		return "productPay/productPay";
	}
}
