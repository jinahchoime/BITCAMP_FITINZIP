package com.spring.FitInZip.back.mypage.vo;

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
public class UserProductDTO {
	private String orderNum;
	private Integer amount;
	private String proNum;
	private Integer paidPrice;
	private Date payDate;
	private String proName;
	private String proImg;
	
	/*조건에 들어갈 아이디명*/
	private String memId;
	
	/*시작번호 끝번호*/
	private Integer startIndex;
	private Integer endIndex;
}
