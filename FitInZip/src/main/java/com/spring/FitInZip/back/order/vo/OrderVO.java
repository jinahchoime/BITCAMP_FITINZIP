package com.spring.FitInZip.back.order.vo;

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
public class OrderVO {

	private String orderNum;
	private String memId;
	private Integer totalPrice;
	private Date orderDate;
	private String postcode;
	private String address;
	private String detailAddress;
	private String directMsg;
}
