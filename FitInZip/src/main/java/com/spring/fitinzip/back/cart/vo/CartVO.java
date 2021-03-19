package com.spring.fitinzip.back.cart.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class CartVO {

	private Integer cartCode;
	private String memId;
	private String proNum;
	private Integer amount;
}
