package com.spring.fitinzip.back.cls.vo;

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
public class ClsVO {

	private String clsCode;
	private String trainerId;
	private String clsCategory;
	private String clsName;
	private String clsTag;
	private Date startDate;
	private Date endDate;
	private String yoil;
	private Date startTime;
	private Date endTime;
	private Integer lapse;
	private String clsLevel;
	private String equip;
	private Integer perPrice;
	private String clsInfo;
	private String curriculum;
	private String clsOriName;
	private String clsFileName;
	private String clsStatus;
	private Integer maxMem;
	private Integer calorie;
	private String meetUrl;
}
