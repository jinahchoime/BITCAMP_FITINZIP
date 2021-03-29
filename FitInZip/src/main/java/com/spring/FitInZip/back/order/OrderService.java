package com.spring.FitInZip.back.order;

import java.util.List;

import com.spring.FitInZip.back.cart.vo.CartDTO;
import com.spring.FitInZip.back.cart.vo.CartVO;

public interface OrderService {

	List<CartDTO> getCartList(CartVO vo);
}
