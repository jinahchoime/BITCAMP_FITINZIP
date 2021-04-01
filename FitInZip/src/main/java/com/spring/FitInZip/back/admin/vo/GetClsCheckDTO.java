package com.spring.FitInZip.back.admin.vo;


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
public class GetClsCheckDTO {
	private String name;
	private String commonName;
	private String clsName;
	private String startDate;
	private String endDate;
	private String yoil;
	private String clsStatus;
	private String clsCode;
}
