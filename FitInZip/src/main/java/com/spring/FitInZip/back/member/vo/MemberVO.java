package com.spring.FitInZip.back.member.vo;

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
}
