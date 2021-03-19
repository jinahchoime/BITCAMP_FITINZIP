package com.spring.fitinzip.back.common.vo;

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
public class MemCouponVO {

	private Integer couponIndex;
	private String memId;
	private String couponCode;
	private String couponStatus;
	private Date couponUseDate;
}
