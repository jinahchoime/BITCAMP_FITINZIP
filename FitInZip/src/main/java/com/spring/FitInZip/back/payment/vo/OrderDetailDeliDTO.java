package com.spring.FitInZip.back.payment.vo;


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
}
