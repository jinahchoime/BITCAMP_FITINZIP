package com.spring.FitInZip.back.trainer.vo;

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
public class TrainerReviewDTO {
	
	private String name;
	private String memFileName;
	
	private String clsName;
	private String reviewContent;
	
	private Date regDate;
	private Integer star;
	
	
	
}
