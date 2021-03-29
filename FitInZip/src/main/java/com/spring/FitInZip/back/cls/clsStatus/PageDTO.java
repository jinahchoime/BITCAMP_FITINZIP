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
		
		this.endPage = (int)(Math.ceil(crt.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / crt.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
