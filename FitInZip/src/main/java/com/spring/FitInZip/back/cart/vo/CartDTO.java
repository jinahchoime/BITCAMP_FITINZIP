package com.spring.FitInZip.back.cart.vo;

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
public class CartDTO {

	private String id;
	private String proImg;
	private String proName;
	private String proPrice;
	private String proNum;
	private Integer amount;
}
