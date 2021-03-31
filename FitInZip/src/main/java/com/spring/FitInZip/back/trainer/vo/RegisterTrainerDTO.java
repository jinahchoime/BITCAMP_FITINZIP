package com.spring.FitInZip.back.trainer.vo;



import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
public class RegisterTrainerDTO {
	
	private String id;
	private String password;
	private String name;
	private String phone;
	private String post;
	private String addr;
	private String detailAddr;
	private String extraAddr;
	private String gender;
	private String birth;
	private String memOriName;
	private String memFileName;
	private String role;
	private String withdrawal;
	private String nickname;
	
	//private String trainerId;
	private String trainerIntro;
	private String career;
	private String question1;
	private String question2;
	private Integer totalCal;
	private String regStatus;
	private String bankAccount;
	private String bankName;
	
	private String ingClass;
	private String reqClass;
	
	
	
	
}
