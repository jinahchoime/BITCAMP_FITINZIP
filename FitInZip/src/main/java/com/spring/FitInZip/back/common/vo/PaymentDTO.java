package com.spring.FitInZip.back.common.vo;

import java.sql.Date;

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
public class PaymentDTO {

	private String couponName;
	private String couponCode;
	private Integer discountPrice;
	
	private String couponStartDate;
	private String couponEndDate;
}
