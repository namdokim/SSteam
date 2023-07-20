package com.ss.demo.domain;

public class UserVO {
	
	private int uNo;
	private String uId;
	private String uPw;
	private String uName;
	private String uNick;
	private String uPhone;
	private String uAdds;
	private String uDate;
	private String uImg;
	private String uType;
	private String uDely;
	private String uPoint;
	//추가 변수
	private String uZipcode;
	private String uId_email;
	//비밀번호 일치 확인 
	
	//추가 된 get set 
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
	public String getuAdds() {
		return uAdds;
	}
	public void setuAdds(String uAdds) {
		this.uAdds = uAdds;
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
				+ ", uPhone=" + uPhone + ", uAdds=" + uAdds + ", uDate=" + uDate + ", uImg=" + uImg + ", uType=" + uType
				+ ", uDely=" + uDely + ", uPoint=" + uPoint + "]";
	}
	
	
}
