package com.spring.FitInZip.back.cls.clsStatus;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	// 시작 페이지, 끝 페이지, 이전, 다음 버튼을 출력하기 위한 클래스
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria crt;
	
	public PageDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public PageDTO(Criteria crt, int total) {
		this.crt = crt;
		this.total = total;
		
		// (getPageNum / 표시할 페이지 수) * 표시할 페이지 수
		this.endPage = (int)(Math.ceil(crt.getPageNum() / 5.0)) * 5;
		
		// (마지막 페이지 - 표시할 페이지 수) + 1
		this.startPage = (this.endPage - crt.getAmount()) + 1;
		
		// (총 데이터 수 * 1.0) / 표시할 페이지 수
		int realEnd = (int)(Math.ceil((total * 1.0) / crt.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
