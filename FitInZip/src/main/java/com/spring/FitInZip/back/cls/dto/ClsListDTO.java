package com.spring.FitInZip.back.cls.dto;

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
public class ClsListDTO {

	private String clsCode;			// 클래스코드
	private String trainerId;		// 강사명
	private String clsCategory;		// 카테고리
	private String clsName;			// 수업명		
	private Date startDate;			// 시작날짜
	private Date endDate;			// 끝날짜
	private String yoil;			// 요일
	private Date startTime;			// 시작시간
	private Date endTime;			// 끝 시간
	private Integer lapse;			// 회차
	private String clsLevel;		// 난이도
	private Integer perPrice;		// 회당 가격	
	private Integer maxMem;			// 최대인원
	private String name;			// 강사 이름
	
}
