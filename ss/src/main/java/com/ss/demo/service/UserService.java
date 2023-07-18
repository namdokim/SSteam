
package com.ss.demo.service;

import org.springframework.stereotype.Service;

import com.ss.demo.domain.UserVO;


public interface UserService {
	
	public int userInsert(UserVO uv);
	public UserVO userlogin(String uId);
	public int uNickCheck(String uNick);
	
	/*
	 * public int memberIdCheckcnt(String uId); public userVO login(String uId);
	 * 
	 * public userVO memberLogin(String uId);
	 */
	
}
