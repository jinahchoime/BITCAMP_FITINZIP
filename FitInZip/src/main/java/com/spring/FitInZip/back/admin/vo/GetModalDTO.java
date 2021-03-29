package com.spring.FitInZip.back.admin.vo;


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
public class GetModalDTO {
	private String id;
	private String name;
	private String phone;
	private String gender;
	private String birth;
	private String trainerIntro;	
	private String career;
	private String questionFirst;
	private String questionSecond;
	private String registerDate;
}
