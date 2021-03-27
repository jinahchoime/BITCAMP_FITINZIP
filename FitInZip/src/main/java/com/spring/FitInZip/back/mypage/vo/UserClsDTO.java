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
public class UserClsDTO {
	private String clsCode;
	private String clsCategory;
	private String clsName;
	private Date startDate;
	private Date endDate;
	private String yoil;
	private Date startTime;
	private Date endTime;
	private String memId;
	private String commonName;
	
}
