package com.spring.fitinzip.back.product.vo;

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
public class ProductVO {

	private String proNum;
	private String proName;
	private Integer proPrice;
	private String proInfo;
	private String proImg;
	private Integer proStock;
}
