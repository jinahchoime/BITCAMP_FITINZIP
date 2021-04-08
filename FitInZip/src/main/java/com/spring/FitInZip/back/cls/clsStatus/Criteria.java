package com.spring.FitInZip.back.cls.clsStatus;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	// 페이징 처리 시 현재 페이지, 페이지에 표시할 글의 갯수를 지정하는 클래스
	private int pageNum;	// 최초 페이지
	private int amount;		// 페이지 당 표시할 글의 수
	private String trainerId;
	//private String classStatus;
	
	public Criteria() {
		// 기본 페이지는 1페이지, 페이지 당 표시할 글의 수는 10개
		this(1, 5);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	/*
	 * public String getClsStatus() { return classStatus == null ? "" : classStatus;
	 * }
	 */
	
	
	
}
