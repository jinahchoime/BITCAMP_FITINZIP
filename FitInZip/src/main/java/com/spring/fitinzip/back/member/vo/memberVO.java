package com.spring.fitinzip.back.member.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class MemberVO {

	private String id;
	private String password;
	private String namephone;
	private String post;
	private String addr_1;
	private String addr_2;
	private String addr_3;
	private String gender;
	private String birth;
	private String memOriName;
	private String memFileName;
	private String role;
	private String withdrawal;
}
