package com.spring.FitInZip.back.review.vo;

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
public class ReviewVO {

	private String trainerId;
	private String classCode;
	private String reviewContent;
	private String memId;
	private Date regDate;
	private Integer star;
}
