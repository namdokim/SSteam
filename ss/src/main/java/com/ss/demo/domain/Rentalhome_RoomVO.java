package com.ss.demo.domain;

public class Rentalhome_RoomVO {
	
	
	private int room_idx;			// 객실 번호
	private int rentalhome_idx;		// 숙소 번호
	private String name;			// 객실 이름
	private int min_person;			// 최소 인원
	private int max_person;			// 최대 인원
	private int weekday_price;		// 상시가
	private int weekend_price;		// 주말가
	private String smoking;			// 객실 내 흡연 가능 여부
	private String wifi;			// 객실 내 와이파이 설치 여부
	private String bed_info;		// 침대정보
	
	private int uNo;			// 유저 번호
	private String contents;	// 내용
	private int service;		// 서비스
	private int facility;		// 시설
	private int clean;			// 청결
	private int price;			// 가격
	
	// 첨부파일
	private int attach_idx;
	private String logical_name;	// 사용자가 올린 파일 이름
	private String physical_name;	// 로컬에 저장된 파일 이름
	private String thumbnail;		// 썸네일 Y, N	
	

	
	public int getAttach_idx() {
		return attach_idx;
	}
	public void setAttach_idx(int attach_idx) {
		this.attach_idx = attach_idx;
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public int getRentalhome_idx() {
		return rentalhome_idx;
	}
	public void setRentalhome_idx(int rentalhome_idx) {
		this.rentalhome_idx = rentalhome_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMin_person() {
		return min_person;
	}
	public void setMin_person(int min_person) {
		this.min_person = min_person;
	}
	public int getMax_person() {
		return max_person;
	}
	public void setMax_person(int max_person) {
		this.max_person = max_person;
	}
	public int getWeekday_price() {
		return weekday_price;
	}
	public void setWeekday_price(int weekday_price) {
		this.weekday_price = weekday_price;
	}
	public int getWeekend_price() {
		return weekend_price;
	}
	public void setWeekend_price(int weekend_price) {
		this.weekend_price = weekend_price;
	}
	public String getSmoking() {
		return smoking;
	}
	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
	}
	public String getBed_info() {
		return bed_info;
	}
	public void setBed_info(String bed_info) {
		this.bed_info = bed_info;
	}
	
}
