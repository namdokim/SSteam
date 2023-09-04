package com.ss.demo.domain;

public class Rentalhome_SearchVO extends Criteria{
	
	private int rentalhome_idx;
	
	private String location;
	private String start_date;
	private String end_date;
	private String person;
	private int currentPage;
	
	private int uNo;
	private int min_price;
	private int max_price;
	private double score;
	private String type;
	private String inPool_yn;		// 내부 수영장
	private String outPool_yn;		// 야외 수영장
	private String parking_yn;		// 주차장
	private String pickup_yn;		// 픽업
	private String wifi_yn;			// 와이파이
	private String beach_yn;		// 인근 해변
	private String bbq_yn;			// 바베큐
	private String breakfast_yn;	// 조식
	private String animal_yn;		// 반려동물
	private String sort;		// 가격 낮은 순
	
	
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getRentalhome_idx() {
		return rentalhome_idx;
	}
	public void setRentalhome_idx(int rentalhome_idx) {
		this.rentalhome_idx = rentalhome_idx;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getMin_price() {
		return min_price;
	}
	public void setMin_price(int min_price) {
		this.min_price = min_price;
	}
	public int getMax_price() {
		return max_price;
	}
	public void setMax_price(int max_price) {
		this.max_price = max_price;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInPool_yn() {
		return inPool_yn;
	}
	public void setInPool_yn(String inPool_yn) {
		this.inPool_yn = inPool_yn;
	}
	public String getOutPool_yn() {
		return outPool_yn;
	}
	public void setOutPool_yn(String outPool_yn) {
		this.outPool_yn = outPool_yn;
	}
	public String getParking_yn() {
		return parking_yn;
	}
	public void setParking_yn(String parking_yn) {
		this.parking_yn = parking_yn;
	}
	public String getPickup_yn() {
		return pickup_yn;
	}
	public void setPickup_yn(String pickup_yn) {
		this.pickup_yn = pickup_yn;
	}
	public String getWifi_yn() {
		return wifi_yn;
	}
	public void setWifi_yn(String wifi_yn) {
		this.wifi_yn = wifi_yn;
	}
	public String getBeach_yn() {
		return beach_yn;
	}
	public void setBeach_yn(String beach_yn) {
		this.beach_yn = beach_yn;
	}
	public String getBbq_yn() {
		return bbq_yn;
	}
	public void setBbq_yn(String bbq_yn) {
		this.bbq_yn = bbq_yn;
	}
	public String getBreakfast_yn() {
		return breakfast_yn;
	}
	public void setBreakfast_yn(String breakfast_yn) {
		this.breakfast_yn = breakfast_yn;
	}
	public String getAnimal_yn() {
		return animal_yn;
	}
	public void setAnimal_yn(String animal_yn) {
		this.animal_yn = animal_yn;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	
	
	@Override
	public String toString() {
		return "Rentalhome_SearchVO [rentalhome_idx=" + rentalhome_idx + ", location=" + location + ", start_date="
				+ start_date + ", end_date=" + end_date + ", person=" + person + ", currentPage=" + currentPage + ", uNo=" + uNo
				+ ", min_price=" + min_price + ", max_price=" + max_price + ", score=" + score + ", type=" + type
				+ ", inPool_yn=" + inPool_yn + ", outPool_yn=" + outPool_yn + ", parking_yn=" + parking_yn
				+ ", pickup_yn=" + pickup_yn + ", wifi_yn=" + wifi_yn + ", beach_yn=" + beach_yn + ", bbq_yn=" + bbq_yn
				+ ", breakfast_yn=" + breakfast_yn + ", animal_yn=" + animal_yn + ", sort=" + sort + "]";
	}
	
	
	
	
		
}
