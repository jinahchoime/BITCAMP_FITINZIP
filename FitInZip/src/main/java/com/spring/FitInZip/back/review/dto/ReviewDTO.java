package com.spring.FitInZip.back.review.dto;



import com.spring.FitInZip.back.cls.dto.ClsListDTO;

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
public class ReviewDTO {
	
	private String trainerId;
	private String clsCode;
	private String memId;
	private Integer star;
	private String reviewContent;
	private String nickName;
}
