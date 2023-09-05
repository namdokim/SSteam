package com.ss.demo.domain;

public class FoodReviewVO {
	
	private int fNo;	//맛집 고유번호 
	private int uNo;	//회원번호 
	private String uNick;	//회원번호 
	
	private int food_review_number;	
	private String food_review_content;	
	private String food_review_writedate;
	
	private int count_all;
	private int count_good;
	private int count_soso;
	private int count_bad;
	
	
	private int food_review_grade;			// 평점 
	private double avg;
	
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
	
	public int getFood_review_grade() {
		return food_review_grade;
	}
	public void setFood_review_grade(int food_review_grade) {
		this.food_review_grade = food_review_grade;
	}
	
	
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
	
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		double double1 = Math.round(avg * 10.0) / 10.0;
		this.avg = double1;
	}
	
	//==========================================
	@Override
	public String toString() {
		return "FoodReviewVO [fNo=" + fNo + ", uNo=" + uNo + ", uNick=" + uNick + ", food_review_number="
				+ food_review_number + ", food_review_content=" + food_review_content + ", food_review_writedate="
				+ food_review_writedate + ", count_all=" + count_all + ", count_good=" + count_good + ", count_soso="
				+ count_soso + ", count_bad=" + count_bad + ", food_review_grade=" + food_review_grade + ", avg=" + avg
				+ "]";
	}
	
	
	
	
	
}
