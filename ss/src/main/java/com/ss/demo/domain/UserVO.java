package com.ss.demo.domain;

public class UserVO {
	
	private int uNo;
	private String uId; // email 도메인도 합쳐서 DB에 넣음 
	private String uPw;
	private String uName;
	private String uNick;
	private String uPhone;
	private String uDate;
	private String uImg;
	private String uType;
	private String uDely;
	private String uPoint;
	//추가 변수
	private String uZipcode;
	private String uId_email;
	private String uSocialType;
	
	public String getuSocialType() {
		return uSocialType;
	}
	public void setuSocialType(String uSocialType) {
		this.uSocialType = uSocialType;
	}

	//추가된 값
	// 주소 관련 
	private String uAddsPostCode;	//우편번호인데 문자열로 받을거임 
	private String uRoadAddress;	// 도로명 주소
	private String uJibunAddress;	// 지번 주소
	private String uDetailAddress;	// 상세주소
	
	// 주소 get set
	public String getuAddsPostCode() {
		return uAddsPostCode;
	}
	public void setuAddsPostCode(String uAddsPostCode) {
		this.uAddsPostCode = uAddsPostCode;
	}
	public String getuRoadAddress() {
		return uRoadAddress;
	}
	public void setuRoadAddress(String uRoadAddress) {
		this.uRoadAddress = uRoadAddress;
	}
	public String getuJibunAddress() {
		return uJibunAddress;
	}
	public void setuJibunAddress(String uJibunAddress) {
		this.uJibunAddress = uJibunAddress;
	}
	public String getuDetailAddress() {
		return uDetailAddress;
	}
	public void setuDetailAddress(String uDetailAddress) {
		this.uDetailAddress = uDetailAddress;
	}
	
	
	//추가 된 get set 
	public String getuZipcode() {
		return uZipcode;
	}
	public void setuZipcode(String uZipcode) {
		this.uZipcode = uZipcode;
	}
	public String getuId_email() {
		return uId_email;
	}
	public void setuId_email(String uId_email) {
		this.uId_email = uId_email;
	}
	
	
	
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuDate() {
		return uDate;
	}
	public void setuDate(String uDate) {
		this.uDate = uDate;
	}
	public String getuImg() {
		return uImg;
	}
	public void setuImg(String uImg) {
		this.uImg = uImg;
	}
	public String getuType() {
		return uType;
	}
	public void setuType(String uType) {
		this.uType = uType;
	}
	public String getuDely() {
		return uDely;
	}
	public void setuDely(String uDely) {
		this.uDely = uDely;
	}
	public String getuPoint() {
		return uPoint;
	}
	public void setuPoint(String uPoint) {
		this.uPoint = uPoint;
	}
	
	@Override
	public String toString() {
		return "userVO [uNo=" + uNo + ", uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uNick=" + uNick
				+ ", uPhone=" + uPhone + ", uDate=" + uDate + ", uImg=" + uImg + ", uType=" + uType
				+ ", uDely=" + uDely + ", uPoint=" + uPoint + "]";
	}
	
	
	
}
