package com.ss.demo.domain;

public class Food_Review_ReportVO {
	
	private int food_review_report_number;
	private int food_review_number;
	private String food_review_report_content;
	private String food_review_report_date;
	private String food_review_report_state;
	private String food_review_report_reson;
	private int uNo;
	
	// getter.setter
	public int getFood_review_report_number() {
		return food_review_report_number;
	}
	public void setFood_review_report_number(int food_review_report_number) {
		this.food_review_report_number = food_review_report_number;
	}
	public int getFood_review_number() {
		return food_review_number;
	}
	public void setFood_review_number(int food_review_number) {
		this.food_review_number = food_review_number;
	}
	public String getFood_review_report_content() {
		return food_review_report_content;
	}
	public void setFood_review_report_content(String food_review_report_content) {
		this.food_review_report_content = food_review_report_content;
	}
	public String getFood_review_report_date() {
		return food_review_report_date;
	}
	public void setFood_review_report_date(String food_review_report_date) {
		this.food_review_report_date = food_review_report_date;
	}
	public String getFood_review_report_state() {
		return food_review_report_state;
	}
	public void setFood_review_report_state(String food_review_report_state) {
		this.food_review_report_state = food_review_report_state;
	}
	public String getFood_review_report_reson() {
		return food_review_report_reson;
	}
	public void setFood_review_report_reson(String food_review_report_reson) {
		this.food_review_report_reson = food_review_report_reson;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	
	// toString
	@Override
	public String toString() {
		return "Food_Review_ReportVO [food_review_report_number=" + food_review_report_number + ", food_review_number="
				+ food_review_number + ", food_review_report_content=" + food_review_report_content
				+ ", food_review_report_date=" + food_review_report_date + ", food_review_report_state="
				+ food_review_report_state + ", food_review_report_reson=" + food_review_report_reson + ", uNo=" + uNo
				+ "]";
	}
	
	
	
}
