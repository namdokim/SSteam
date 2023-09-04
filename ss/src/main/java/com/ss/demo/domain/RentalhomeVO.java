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

	private double all_avg;			// 평점
	private int review_count;		// 리뷰 갯수
	private int like_count;			// 좋아요 갯수
	private int dupl_count;			// 로그인 시 좋아요 ON/OFF
	private String room_name;		// 최저가 방 이름
	private int min_person;			// 최저가 방의 최소 인원
	private int max_person;			// 최저가 방의 최대 인원
	private int weekday_price;		// 최저가 방의 평일가
	private int weekend_price;		// 최저가 방의 주말가
	private String discount_reason;	// 할인 이유
	private int discount_money;		// 할인 수치
	private String discount_type;	// 할인 종류
	private int weekday_discount_price;		// 최저가 방의 평일 할인가
	private int weekend_discount_price;		// 최저가 방의 주말 할인가
	
	
	private int attach_idx;			// 숙소 첨부파일 번호
	private String logical_name;	// 사용자가 올린 파일 이름
	private String physical_name;	// 로컬에 저장된 파일 이름
	private String thumbnail;		// 썸네일 Y, N	
	
	
	public double getAll_avg() {
		return all_avg;
	}
	public void setAll_avg(double all_avg) {
		double all_avg_ = Double.parseDouble(String.format("%.1f", all_avg));
		this.all_avg = all_avg_;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getDupl_count() {
		return dupl_count;
	}
	public void setDupl_count(int dupl_count) {
		this.dupl_count = dupl_count;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
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
	public String getDiscount_reason() {
		return discount_reason;
	}
	public void setDiscount_reason(String discount_reason) {
		this.discount_reason = discount_reason;
	}
	public int getDiscount_money() {
		return discount_money;
	}
	public void setDiscount_money(int discount_money) {
		this.discount_money = discount_money;
	}
	public String getDiscount_type() {
		return discount_type;
	}
	public void setDiscount_type(String discount_type) {
		this.discount_type = discount_type;
	}
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
	public int getAttach_idx() {
		return attach_idx;
	}
	public void setAttach_idx(int attach_idx) {
		this.attach_idx = attach_idx;
	}
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
				+ breakfast_close + ", breakfast_day=" + breakfast_day + ", all_avg=" + all_avg + ", review_count="
				+ review_count + ", like_count=" + like_count + ", dupl_count=" + dupl_count + ", room_name="
				+ room_name + ", min_person=" + min_person + ", max_person=" + max_person + ", weekday_price="
				+ weekday_price + ", weekend_price=" + weekend_price + ", discount_reason=" + discount_reason
				+ ", discount_money=" + discount_money + ", discount_type=" + discount_type
				+ ", weekday_discount_price=" + weekday_discount_price + ", weekend_discount_price="
				+ weekend_discount_price + ", attach_idx=" + attach_idx + ", logical_name=" + logical_name
				+ ", physical_name=" + physical_name + ", thumbnail=" + thumbnail + "]";
	}
	
	
}
