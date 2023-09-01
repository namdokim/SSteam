package com.ss.demo.domain;

public class Rentalhome_ReviewVO {
	private int review_idx;
	private int room_idx;
	private String room_name;
	private int service;
	private int facility;
	private int clean;
	private int price;
	private int uNo;
	private String uNick;
	private String wdate;
	private String contents;
	private String stay_date;
	
	private int count;
	private double service_avg;
	private double facility_avg;
	private double clean_avg;
	private double price_avg;
	private double all_avg;
	private double one_avg;
	
	
	
	public String getStay_date() {
		return stay_date;
	}
	public void setStay_date(String stay_date) {
		this.stay_date = stay_date;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public double getOne_avg() {
		return one_avg;
	}
	public void setOne_avg(double one_avg) {
		double one_avg_ = Double.parseDouble(String.format("%.1f", one_avg));
		this.one_avg = one_avg_;
	}
	public double getService_avg() {
		return service_avg;
	}
	public void setService_avg(double service_avg) {
		double service_avg_ = Double.parseDouble(String.format("%.1f", service_avg));
		this.service_avg = service_avg_;
	}
	public double getFacility_avg() {
		return facility_avg;
	}
	public void setFacility_avg(double facility_avg) {
		double facility_avg_ = Double.parseDouble(String.format("%.1f", facility_avg));
		this.facility_avg = facility_avg_;
	}
	public double getClean_avg() {
		return clean_avg;
	}
	public void setClean_avg(double clean_avg) {
		double clean_avg_ = Double.parseDouble(String.format("%.1f", clean_avg));
		this.clean_avg = clean_avg_;
	}
	public double getPrice_avg() {
		return price_avg;
	}
	public void setPrice_avg(double price_avg) {
		double price_avg_ = Double.parseDouble(String.format("%.1f", price_avg));
		this.price_avg = price_avg_;
	}
	public double getAll_avg() {
		return all_avg;
	}
	public void setAll_avg(double all_avg) {
		double all_avg_ = Double.parseDouble(String.format("%.1f", all_avg));
		this.all_avg = all_avg_;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public int getService() {
		return service;
	}
	public void setService(int service) {
		this.service = service;
	}
	public int getFacility() {
		return facility;
	}
	public void setFacility(int facility) {
		this.facility = facility;
	}
	public int getClean() {
		return clean;
	}
	public void setClean(int clean) {
		this.clean = clean;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
	@Override
	public String toString() {
		return "Rentalhome_ReviewVO [review_idx=" + review_idx + ", room_idx=" + room_idx + ", service=" + service
				+ ", facility=" + facility + ", clean=" + clean + ", price=" + price + ", uNo=" + uNo + ", wdate="
				+ wdate + ", contents=" + contents + ", count=" + count + ", service_avg=" + service_avg
				+ ", facility_avg=" + facility_avg + ", clean_avg=" + clean_avg + ", price_avg=" + price_avg
				+ ", all_avg=" + all_avg + "]";
	}
	
}
