package com.ss.demo.domain;


import org.springframework.stereotype.Component;

@Component
public class PageMaker {
	
	private int displayPageNum = 10; 	
	private int startPage;
	private int endPage;
	
	private int totalCount; 
	
	private boolean prev;
	private boolean next;	
	
	private Criteria cri;
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int diplayPageNum) {
		this.displayPageNum = diplayPageNum;
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

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum);
		startPage = (endPage-displayPageNum)+1;   
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = (startPage ==1 ? false : true);
		next = (endPage*cri.getPerPageNum() >= totalCount ? false :true);
		
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

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [displayPageNum=" + displayPageNum + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalCount=" + totalCount + ", prev=" + prev + ", next=" + next + ", cri=" + cri.getPage() + ", cri=" + cri.getPerPageNum() + ", cri=" + cri.getsNum() + "]";
	}

}
