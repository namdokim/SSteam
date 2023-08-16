package com.ss.demo.domain;

public class FoodReviewVO {
	
	private int fNo;	//맛집 고유번호 
	private int uNo;	//회원번호 
	private String uNick;	//회원번호 
	
	private int food_review_number;	
	private String food_review_content;	
	private String food_review_writedate;
	
	//==========================================
	 
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getFood_review_number() {
		return food_review_number;
	}
	public void setFood_review_number(int food_review_number) {
		this.food_review_number = food_review_number;
	}
	public String getFood_review_content() {
		return food_review_content;
	}
	public void setFood_review_content(String food_review_content) {
		this.food_review_content = food_review_content;
	}
	public String getFood_review_writedate() {
		return food_review_writedate;
	}
	public void setFood_review_writedate(String food_review_writedate) {
		this.food_review_writedate = food_review_writedate;
	}
	
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	
	//==========================================
	
	@Override
	public String toString() {
		return "FoodReviewVO [fNo=" + fNo + ", uNo=" + uNo + ", uNick=" + uNick + ", food_review_number="
				+ food_review_number + ", food_review_content=" + food_review_content + ", food_review_writedate="
				+ food_review_writedate + "]";
	}
	
	
	
	
	
}
