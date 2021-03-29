package com.spring.FitInZip.back.mypage.vo;

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
public class UserCouponDTO {
	private String couponName;
	private String couponCode;
	private Integer discountPrice;
	private Date couponStartDate;
	private Date couponEndDate;
	private String commonName; /*쿠폰 사용 상태*/
	private String memId; 
	private Integer unusedCount; /*미사용 쿠폰 수*/
}
