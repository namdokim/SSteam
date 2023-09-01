package com.ss.demo.domain;

public class Food_ReportVO {
	
	private String food_report_content;
	private int fNo;
	private int uNo;
	private String food_report_date;
	private String food_report_state;
	private String food_report_reson;
	private int food_report_number;
	
	// getter.setter
	public String getFood_report_content() {
		return food_report_content;
	}
	public void setFood_report_content(String food_report_content) {
		this.food_report_content = food_report_content;
	}
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
	public String getFood_report_date() {
		return food_report_date;
	}
	public void setFood_report_date(String food_report_date) {
		this.food_report_date = food_report_date;
	}
	public String getFood_report_state() {
		return food_report_state;
	}
	public void setFood_report_state(String food_report_state) {
		this.food_report_state = food_report_state;
	}
	public String getFood_report_reson() {
		return food_report_reson;
	}
	public void setFood_report_reson(String food_report_reson) {
		this.food_report_reson = food_report_reson;
	}
	public int getFood_report_number() {
		return food_report_number;
	}
	public void setFood_report_number(int food_report_number) {
		this.food_report_number = food_report_number;
	}
	
	
	// toString()
	@Override
	public String toString() {
		return "Food_ReportVO [food_report_content=" + food_report_content + ", fNo=" + fNo + ", uNo=" + uNo
				+ ", food_report_date=" + food_report_date + ", food_report_state=" + food_report_state
				+ ", food_report_reson=" + food_report_reson + ", food_report_number=" + food_report_number + "]";
	}
	
	
}
