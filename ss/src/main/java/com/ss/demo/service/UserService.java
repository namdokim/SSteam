
package com.ss.demo.service;

import org.springframework.stereotype.Service;

import com.ss.demo.domain.UserVO;


public interface UserService {
	
	public int userInsert(UserVO uv);
	// 회원 로그인 
	public UserVO userlogin(String uId);
	// nick 중복체크
	public int uNickCheck(String uNick);
	//id 중복체크
	public int uIdCheck(String uId);
	
	/*
	 * public int memberIdCheckcnt(String uId); public userVO login(String uId);
	 * 
	 * public userVO memberLogin(String uId);
	 */
	
}
