package com.ss.demo.domain;

import java.util.Arrays;

public class FoodVO 
{ 
	private int fNo;	//맛집 고유번호 
	private int uNo;	//회원번호 					
	
	private String food_name;					// 식당 이름 
	private String food_address;				// 식당 주소  
	private String food_phone;					// 식당 번호 
	private String food_food_kind;				// 식당 음식 종류 
	private String food_avg_price;				// 식당 음식 평균 가격대 
	private String food_write_date;				// 작성일 
	private String food_working_hours;			// 식당 영업 시간 
	private String food_holiday;				// 식당 휴일 
	private String food_website;				// 식당 웹사이트 
	private String food_content;				// 식당 설명글 

	private int    food_menu_number;			// 메뉴 번호 
	private String food_menu_name;				// 메뉴 이름 
	private String food_menu_price;				// 메뉴 가격 
	
	//-------------- 지역선택 
	private String  LType;						
	
	//-------------- 첨부파일 
	private int food_attach_number;				// food 첨부파일 번호 
	private String food_attach_logical_name;	// 사용자가 올린 파일 이름
	private String food_attach_physical_name;	// 로컬에 저장된 파일 이름
	private String thumbnail;					// 썸네일 Y, N
	
	//========================================== GETTER / SETTER
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getFood_address() {
		return food_address;
	}
	public void setFood_address(String food_address) {
		this.food_address = food_address;
	}
	public String getFood_phone() {
		return food_phone;
	}
	public void setFood_phone(String food_phone) {
		this.food_phone = food_phone;
	}
	public String getFood_food_kind() {
		return food_food_kind;
	}
	public void setFood_food_kind(String food_food_kind) {
		this.food_food_kind = food_food_kind;
	}
	public String getFood_avg_price() {
		return food_avg_price;
	}
	public void setFood_avg_price(String food_avg_price) {
		this.food_avg_price = food_avg_price;
	}
	public String getFood_write_date() {
		return food_write_date;
	}
	public void setFood_write_date(String food_write_date) {
		this.food_write_date = food_write_date;
	}
	public String getFood_working_hours() {
		return food_working_hours;
	}
	public void setFood_working_hours(String food_working_hours) {
		this.food_working_hours = food_working_hours;
	}
	public String getFood_holiday() {
		return food_holiday;
	}
	public void setFood_holiday(String food_holiday) {
		this.food_holiday = food_holiday;
	}
	public String getFood_website() {
		return food_website;
	}
	public void setFood_website(String food_website) {
		this.food_website = food_website;
	}
	public String getFood_content() {
		return food_content;
	}
	public void setFood_content(String food_content) {
		this.food_content = food_content;
	}
	
	
	public int getFood_menu_number() {
		return food_menu_number;
	}
	public void setFood_menu_number(int food_menu_number) {
		this.food_menu_number = food_menu_number;
	}
	
	public String getFood_menu_name() {
		return food_menu_name;
	}
	public void setFood_menu_name(String food_menu_name) {
		this.food_menu_name = food_menu_name;
	}
	public String getFood_menu_price() {
		return food_menu_price;
	}
	public void setFood_menu_price(String food_menu_price) {
		this.food_menu_price = food_menu_price;
	}
	
	//-------------------------------------- ltype (지역선택)  
	
	public String getLType() {
		return LType;
	}
	public void setLType(String lType) {
		LType = lType;
	}
	
	//--------------------------------------
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getFood_attach_logical_name() {
		return food_attach_logical_name;
	}
	public void setFood_attach_logical_name(String food_attach_logical_name) {
		this.food_attach_logical_name = food_attach_logical_name;
	}
	public String getFood_attach_physical_name() {
		return food_attach_physical_name;
	}
	public void setFood_attach_physical_name(String food_attach_physical_name) {
		this.food_attach_physical_name = food_attach_physical_name;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public int getFood_attach_number() {
		return food_attach_number;
	}
	public void setFood_attach_number(int food_attach_number) {
		this.food_attach_number = food_attach_number;
	}
	
	//======================================================== toString
	@Override
	public String toString() {
		return "FoodVO [fNo=" + fNo + ", uNo=" + uNo + ", food_name=" + food_name + ", food_address=" + food_address
				+ ", food_phone=" + food_phone + ", food_food_kind=" + food_food_kind + ", food_avg_price="
				+ food_avg_price + ", food_write_date=" + food_write_date + ", food_working_hours=" + food_working_hours
				+ ", food_holiday=" + food_holiday + ", food_website=" + food_website + ", food_content=" + food_content
				+ ", food_menu_number=" + food_menu_number + ", food_menu_name=" + food_menu_name + ", food_menu_price="
				+ food_menu_price + ", LType=" + LType + ", food_attach_number=" + food_attach_number
				+ ", food_attach_logical_name=" + food_attach_logical_name + ", food_attach_physical_name="
				+ food_attach_physical_name + ", thumbnail=" + thumbnail + "]";
	}
	
	
	
	
}