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
public class UserCountDTO {
	/*
	 * 시작시간 private Date startTime; 끝시간 private Date endTime;
	 */
	
	//시간차이
	private Integer timeCount;
	
	/* 칼로리시간 */
	private Integer calorieCount;

	/* 운동횟수 */
	private Integer lapseCount;
	/* 체크인수 */
	private Integer checkinCount;
	/* 총 클래스 수 */
	private Integer clscount;
	
	//private String memId;
}
