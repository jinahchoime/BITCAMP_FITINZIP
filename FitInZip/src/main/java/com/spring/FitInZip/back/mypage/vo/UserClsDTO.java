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
public class UserClsDTO {
	private String clsCode;
	private String clsCategory;
	private String clsName;
	private Date startDate;
	private Date endDate;
	private String yoil;
	private Date startTime;
	private Date endTime;
	private String memId;
	private String commonName;
	private String meetUrl;
	
	/*시작번호 끝번호*/
	private Integer startIndex;
	private Integer endIndex;
	
	/*총 게시물 수*/
	private Integer count;
	
	/*클래스 상태*/
	private String clsTimeStatus;
	
	/*클래스 결제날짜, 결제금액, 결제방법*/
	private Integer paidPrice;
	private String method;
	private String paydate;
	
	/*클래스 카테고리 - 클래스내역에서 사용됨*/
	private String cate;
	
	
}
