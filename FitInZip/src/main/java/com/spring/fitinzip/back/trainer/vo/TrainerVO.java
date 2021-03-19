package com.spring.fitinzip.back.trainer.vo;

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
public class TrainerVO {

	private String trainerId;
	private String trainerIntro;
	private String career;
	private String question_1;
	private String question_2;
	private Integer totalCal;
	private String regStatus;
	private String bankAccount;
	private String bankName;
}
