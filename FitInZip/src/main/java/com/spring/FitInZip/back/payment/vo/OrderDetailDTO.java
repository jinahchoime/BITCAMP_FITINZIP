package com.spring.FitInZip.back.payment.vo;


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
public class OrderDetailDTO {

	private String orderNum;
	private String proNum;
	private String proImg;
	private String proName;
	private String proPrice;
	private Integer amount;
}
