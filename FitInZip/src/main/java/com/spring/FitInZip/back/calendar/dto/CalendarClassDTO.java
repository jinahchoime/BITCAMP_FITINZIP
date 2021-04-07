package com.spring.FitInZip.back.calendar.dto;

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
public class CalendarClassDTO {
	
	private String clsName;
	private String startDate;
	private String endDate;
	private String yoil;
	
}
