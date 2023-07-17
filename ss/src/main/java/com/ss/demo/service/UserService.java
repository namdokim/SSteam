
package com.ss.demo.service;

import org.springframework.stereotype.Service;

import com.ss.demo.domain.userVO;


public interface UserService {
	
	public int userInsert(userVO uv);
	public userVO userlogin(String uId);
	/*
	 * public int memberIdCheckcnt(String uId); public userVO login(String uId);
	 * 
	 * public userVO memberLogin(String uId);
	 */
	
}
