package com.spring.fitinzip.back.order.vo;

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
	private String post;
	private String addr_1;
	private String addr_2;
	private String deliveryMsg;
}
