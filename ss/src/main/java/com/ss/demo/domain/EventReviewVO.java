package com.ss.demo.domain;

public class EventReviewVO {
	
	private int comment_number;
	private int event_number;
	private int uNo;
	private int Ratio;
	
	private String comment_content;
	private String comment_title;
	
	private int event_review_grade;
	private int count_all;
	private int count_good;
	private int count_soso;
	private int count_bad;
	
	
	public int getCount_all() {
		return count_all;
	}
	public void setCount_all(int count_all) {
		this.count_all = count_all;
	}
	public int getCount_good() {
		return count_good;
	}
	public void setCount_good(int count_good) {
		this.count_good = count_good;
	}
	public int getCount_soso() {
		return count_soso;
	}
	public void setCount_soso(int count_soso) {
		this.count_soso = count_soso;
	}
	public int getCount_bad() {
		return count_bad;
	}
	public void setCount_bad(int count_bad) {
		this.count_bad = count_bad;
	}


	public int getEvent_review_grade() {
		return event_review_grade;
	}
	public void setEvent_review_grade(int event_review_grade) {
		this.event_review_grade = event_review_grade;
	}
	public int getComment_number() {
		return comment_number;
	}
	public int getEvent_number() {
		return event_number;
	}
	public int getuNo() {
		return uNo;
	}
	public int getRatio() {
		return Ratio;
	}
	public String getComment_content() {
		return comment_content;
	}
	public String getComment_title() {
		return comment_title;
	}
	
	
	
	
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public void setEvent_number(int event_number) {
		this.event_number = event_number;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public void setRatio(int ratio) {
		Ratio = ratio;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public void setComment_title(String comment_title) {
		this.comment_title = comment_title;
	}
	
	
	@Override
	public String toString() {
		return "EventReviewVO [comment_number=" + comment_number + ", event_number=" + event_number + ", uNo=" + uNo
				+ ", Ratio=" + Ratio + ", comment_content=" + comment_content + ", comment_title=" + comment_title
				+ "]";
	}
	
	
	
}
