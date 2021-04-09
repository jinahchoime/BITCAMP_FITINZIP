package com.spring.FitInZip.back.payment.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class OrderDetailDeliDTO {

	private String name;
	private String phone;
	private String address;
	private String detailAddress;
	private String directMsg;
	private Date orderDate;
	private Integer paidPrice;
	private String payMethod;
	private String commonName;
}

