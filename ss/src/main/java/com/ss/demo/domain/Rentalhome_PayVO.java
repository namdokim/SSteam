package com.ss.demo.domain;

import java.sql.Timestamp;

public class Rentalhome_PayVO {
	
	
	private String pay_idx;
	private String reserve_number;
	private int room_idx;
	private String kind;
	private String bank;
	private int price;
	private String pay_date;
	private String pay_status;
	private String start_date;
	private String end_date;
	private Timestamp refund_date;
	private int uno;
	private String guest_name;
	private String guest_tel;
	private String guest_email;
	private String request;
	private String product;
	private String product_name;
	private int point;
	private int discount;
	private String review_yn;
	
	
	
	public String getReview_yn() {
		return review_yn;
	}
	public void setReview_yn(String review_yn) {
		this.review_yn = review_yn;
	}
	public Timestamp getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(Timestamp refund_date) {
		this.refund_date = refund_date;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getGuest_name() {
		return guest_name;
	}
	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}
	public String getGuest_tel() {
		return guest_tel;
	}
	public void setGuest_tel(String guest_tel) {
		this.guest_tel = guest_tel;
	}
	public String getGuest_email() {
		return guest_email;
	}
	public void setGuest_email(String guest_email) {
		this.guest_email = guest_email;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(String pay_idx) {
		this.pay_idx = pay_idx;
	}
	public String getReserve_number() {
		return reserve_number;
	}
	public void setReserve_number(String reserve_number) {
		this.reserve_number = reserve_number;
	}
	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
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
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	
	
	@Override
	public String toString() {
		return "Rentalhome_PayVO [pay_idx=" + pay_idx + ", reserve_number=" + reserve_number + ", room_idx=" + room_idx
				+ ", kind=" + kind + ", bank=" + bank + ", price=" + price + ", pay_date=" + pay_date + ", pay_status="
				+ pay_status + ", start_date=" + start_date + ", end_date=" + end_date + ", refund_date=" + refund_date
				+ ", uno=" + uno + ", guest_name=" + guest_name + ", guest_tel=" + guest_tel + ", guest_email="
				+ guest_email + ", request=" + request + ", product=" + product + ", product_name=" + product_name
				+ ", point=" + point + ", discount=" + discount + ", review_yn=" + review_yn + "]";
	}
	
	
	
	
}
