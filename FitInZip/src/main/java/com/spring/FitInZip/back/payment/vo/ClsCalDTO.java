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
public class ClsCalDTO {

	private Integer totalCal;		// 강사 정산금
	private String trainerId;		// 강사아이디

}
