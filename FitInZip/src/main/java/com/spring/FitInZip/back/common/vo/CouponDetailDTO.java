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
public class CouponDetailDTO {
	
		private String couponName;
		private String couponCode;
		private Integer discountPrice;
		private Date couponStartDate;
		private Date couponEndDate;
		private Integer finalPrice;
	

}
