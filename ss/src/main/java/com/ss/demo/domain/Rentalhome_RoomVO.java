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
	private String discount_reason;
	private String discount_type;
	private int discount_money;
	private int uNo;			// 유저 번호
	private int weekday_discount_price;
	private int weekend_discount_price;
	// 첨부파일
	private int attach_idx;
	private String logical_name;	// 사용자가 올린 파일 이름
	private String physical_name;	// 로컬에 저장된 파일 이름
	private String thumbnail;		// 썸네일 Y, N	

	
	
	
	public int getWeekday_discount_price() {
		return weekday_discount_price;
	}
	public void setWeekday_discount_price(int weekday_discount_price) {
		this.weekday_discount_price = weekday_discount_price;
	}
	public int getWeekend_discount_price() {
		return weekend_discount_price;
	}
	public void setWeekend_discount_price(int weekend_discount_price) {
		this.weekend_discount_price = weekend_discount_price;
	}
	public String getDiscount_reason() {
		return discount_reason;
	}
	public void setDiscount_reason(String discount_reason) {
		this.discount_reason = discount_reason;
	}
	public String getDiscount_type() {
		return discount_type;
	}
	public void setDiscount_type(String discount_type) {
		this.discount_type = discount_type;
	}
	public int getDiscount_money() {
		return discount_money;
	}
	public void setDiscount_money(int discount_money) {
		this.discount_money = discount_money;
	}
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
	
	
	
	@Override
	public String toString() {
		return "Rentalhome_RoomVO [room_idx=" + room_idx + ", rentalhome_idx=" + rentalhome_idx + ", name=" + name
				+ ", min_person=" + min_person + ", max_person=" + max_person + ", weekday_price=" + weekday_price
				+ ", weekend_price=" + weekend_price + ", smoking=" + smoking + ", wifi=" + wifi + ", bed_info="
				+ bed_info + ", discount_reason=" + discount_reason + ", discount_type=" + discount_type
				+ ", discount_money=" + discount_money + ", uNo=" + uNo + ", weekday_discount_price="
				+ weekday_discount_price + ", weekend_discount_price=" + weekend_discount_price + ", attach_idx="
				+ attach_idx + ", logical_name=" + logical_name + ", physical_name=" + physical_name + ", thumbnail="
				+ thumbnail + "]";
	}
	
	
	
	
}
