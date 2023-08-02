package com.ss.demo.domain;

public class RentalhomeVO {
	
	private int rentalhome_idx;		// 숙소 번호
	private int uNo;				// 회원 번호
	private String name;			// 숙소 이름
	private String address;			// 주소
	private String info;			// 숙소 소개글
	private String type;			// 숙소 종류
	private String inPool_yn;		// 내부 수영장
	private String outPool_yn;		// 야외 수영장
	private String parking_yn;		// 주차장
	private String pickup_yn;		// 픽업
	private String wifi_yn;			// 와이파이
	private String beach_yn;		// 인근 해변
	private String bbq_yn;			// 바베큐
	private String breakfast_yn;	// 조식
	private String animal_yn;		// 반려동물
	private String checkIn;			// 체크인 시간
	private String checkOut;		// 체크아웃 시간
	private String checkIn_info;	// 체크인 방법
	private String breakfast_price;	// 조식 가격
	private String breakfast_open;	// 조식 시작시간
	private String breakfast_close;	// 조식 마감시간
	private String breakfast_day;	// 조식 영업일

	private String logical_name;	// 사용자가 올린 파일 이름
	private String physical_name;	// 로컬에 저장된 파일 이름
	private String thumbnail;		// 썸네일 Y, N	
	
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getLogical_name() {
		return logical_name;
	}
	public void setLogical_name(String logical_name) {
		this.logical_name = logical_name;
	}
	public String getPhysical_name() {
		return physical_name;
	}
	public void setPhysical_name(String physical_name) {
		this.physical_name = physical_name;
	}
	public int getRentalhome_idx() {
		return rentalhome_idx;
	}
	public void setRentalhome_idx(int rentalhome_idx) {
		this.rentalhome_idx = rentalhome_idx;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
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
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getCheckIn_info() {
		return checkIn_info;
	}
	public void setCheckIn_info(String checkIn_info) {
		this.checkIn_info = checkIn_info;
	}
	public String getBreakfast_price() {
		return breakfast_price;
	}
	public void setBreakfast_price(String breakfast_price) {
		this.breakfast_price = breakfast_price;
	}
	public String getBreakfast_open() {
		return breakfast_open;
	}
	public void setBreakfast_open(String breakfast_open) {
		this.breakfast_open = breakfast_open;
	}
	public String getBreakfast_close() {
		return breakfast_close;
	}
	public void setBreakfast_close(String breakfast_close) {
		this.breakfast_close = breakfast_close;
	}
	public String getBreakfast_day() {
		return breakfast_day;
	}
	public void setBreakfast_day(String breakfast_day) {
		this.breakfast_day = breakfast_day;
	}
	
	@Override
	public String toString() {
		return "RentalhomeVO [rentalhome_idx=" + rentalhome_idx + ", uNo=" + uNo + ", name=" + name + ", address="
				+ address + ", info=" + info + ", type=" + type + ", inPool_yn=" + inPool_yn + ", outPool_yn="
				+ outPool_yn + ", parking_yn=" + parking_yn + ", pickup_yn=" + pickup_yn + ", wifi_yn=" + wifi_yn
				+ ", beach_yn=" + beach_yn + ", bbq_yn=" + bbq_yn + ", breakfast_yn=" + breakfast_yn + ", animal_yn="
				+ animal_yn + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", checkIn_info=" + checkIn_info
				+ ", breakfast_price=" + breakfast_price + ", breakfast_open=" + breakfast_open + ", breakfast_close="
				+ breakfast_close + ", breakfast_day=" + breakfast_day + "]";
	}
	
}
