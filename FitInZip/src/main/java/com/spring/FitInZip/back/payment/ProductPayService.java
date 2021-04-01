package com.spring.FitInZip.back.payment;

import java.util.List;

import com.spring.FitInZip.back.cart.vo.CartDTO;

public interface ProductPayService {

	List<CartDTO> getPayList(String mem_id);
}
