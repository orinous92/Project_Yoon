package com.project.biz.paging;



public class Criteria {
		
	private int pageNum;	// 현재 페이지 번호
	private int amount;		// 페이지당 출력 항목 수
	
	
	public Criteria() {
		this(1,10);		// 기본값  : 1페이지 , 항목수 = 10
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	

	// Getter / Setter 
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		if(amount > 50 || 0 >= amount) {
			this.amount = 10;
		} else {
			this.amount = amount;
		}
	}
	
	// 각 페이지의 시작 번호를 구하는 메소드
	public int getPageStart() {
		return (this.pageNum - 1) * this.amount + 1;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
	
}
