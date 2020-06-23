package com.project.biz.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


public class PageMaker {
	
	private Criteria cri;		
	
	private int total;			
	
	private int startPage;		
	private int endPage;		
	private boolean prev, next; 
	
	private int displayPageNum = 10; 
	private int realEndPage;	
	
	public void setTotal(int total) {
		this.total = total;
		
		fieldInit();
	}
	
	public void fieldInit() {
		
		endPage = (int)(Math.ceil(cri.getPageNum() / (double)displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		realEndPage = (int)(Math.ceil(total/(double)cri.getAmount()));
		
		if(endPage > realEndPage) {
			endPage = realEndPage;
		}
		prev = (startPage == 1) ? false : true ;
		
		next = (endPage == realEndPage) ? false : true;
		
	}
	
	public String makeQuery(int page) {
		UriComponents uricomp = UriComponentsBuilder.newInstance()
								.queryParam("pageNum", page)
								.queryParam("amount", cri.getAmount())
								.build();
		
		return uricomp.toUriString();
	}


	public Criteria getCri() {
		return cri;
	}


	public void setCri(Criteria cri) {
		this.cri = cri;
	}


	public int getTotal() {
		return total;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getDisplayPageNum() {
		return displayPageNum;
	}


	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}


	public int getRealEndPage() {
		return realEndPage;
	}


	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}


	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", total=" + total + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", realEndPage="
				+ realEndPage + "]";
	}
	
	
	
	
}
