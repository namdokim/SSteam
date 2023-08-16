
package com.ss.demo.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.ss.demo.domain.UserVO;


public interface UserService {
	
	public int userInsert(UserVO uv);
	// 회원 로그인 
	public UserVO userlogin(UserVO uv);
	// nick 중복체크
	public int uNickCheck(String uNick);
	//id 중복체크
	public int uIdCheck(String uId);
	public UserVO uPwCheck(String uId);
	//유저 조회
	public UserVO userONE(UserVO uv);
	// 이미지 수정 
	public int profileimg(Map<String, Object> map);

	/*
	 * public int memberIdCheckcnt(String uId); public userVO login(String uId);
	 * 
	 * public userVO memberLogin(String uId);
	 */
	
}
