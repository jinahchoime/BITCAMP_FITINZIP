package com.spring.FitInZip.back.admin.vo;

import com.spring.FitInZip.back.cart.vo.CartVO;

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
public class MapVO {
	private String mapAddr;
	private String latitude;
	private String hardness;
}
