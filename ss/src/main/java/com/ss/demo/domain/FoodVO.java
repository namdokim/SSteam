package com.ss.demo.domain;

public class FoodVO 
{
	private int food_number;
	private String food_title;
	private double food_grade;
	private String food_adress;
	private int food_call;
	private String food_foodkind;
	private int food_money;
	private String food_car;
	
	private String food_write_date;
	private String food_working;
	private int food_rest;
	private String food_website;
	private int food_map;
	
	private int uNo;
	// ============================================= getter, setter
	public int getFood_number() {
		return food_number;
	}
	public void setFood_number(int food_number) {
		this.food_number = food_number;
	}
	public String getFood_title() {
		return food_title;
	}
	public void setFood_title(String food_title) {
		this.food_title = food_title;
	}
	public double getFood_grade() {
		return food_grade;
	}
	public void setFood_grade(double food_grade) {
		this.food_grade = food_grade;
	}
	public String getFood_adress() {
		return food_adress;
	}
	public void setFood_adress(String food_adress) {
		this.food_adress = food_adress;
	}
	public int getFood_call() {
		return food_call;
	}
	public void setFood_call(int food_call) {
		this.food_call = food_call;
	}
	public String getFood_foodkind() {
		return food_foodkind;
	}
	public void setFood_foodkind(String food_foodkind) {
		this.food_foodkind = food_foodkind;
	}
	public int getFood_money() {
		return food_money;
	}
	public void setFood_money(int food_money) {
		this.food_money = food_money;
	}
	public String getFood_car() {
		return food_car;
	}
	public void setFood_car(String food_car) {
		this.food_car = food_car;
	}
	public String getFood_write_date() {
		return food_write_date;
	}
	public void setFood_write_date(String food_write_date) {
		this.food_write_date = food_write_date;
	}
	public String getFood_working() {
		return food_working;
	}
	public void setFood_working(String food_working) {
		this.food_working = food_working;
	}
	public int getFood_rest() {
		return food_rest;
	}
	public void setFood_rest(int food_rest) {
		this.food_rest = food_rest;
	}
	public String getFood_website() {
		return food_website;
	}
	public void setFood_website(String food_website) {
		this.food_website = food_website;
	}
	public int getFood_map() {
		return food_map;
	}
	public void setFood_map(int food_map) {
		this.food_map = food_map;
	}
	
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	@Override
	public String toString() {
		return "FoodVO [food_number=" + food_number + ", food_title=" + food_title + ", food_grade=" + food_grade
				+ ", food_adress=" + food_adress + ", food_call=" + food_call + ", food_foodkind=" + food_foodkind
				+ ", food_money=" + food_money + ", food_car=" + food_car + ", food_write_date=" + food_write_date
				+ ", food_working=" + food_working + ", food_rest=" + food_rest + ", food_website=" + food_website
				+ ", food_map=" + food_map + ", uNo=" + uNo + "]";
	}
	
	
	
}