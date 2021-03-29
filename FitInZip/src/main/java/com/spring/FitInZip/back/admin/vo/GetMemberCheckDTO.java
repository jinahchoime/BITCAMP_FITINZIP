package com.spring.FitInZip.back.admin.vo;


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
public class GetMemberCheckDTO {
	private String name;
	private String id;
	private String gender;
	private String birth;
	private String commonName;
}
