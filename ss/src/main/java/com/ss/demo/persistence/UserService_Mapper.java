package com.ss.demo.persistence;

import com.ss.demo.domain.userVO;


public interface UserService_Mapper {

	public int userInsert(userVO uv);
	public userVO userlogin(String uId);
	/*
	 * public userVO login(String uId); public int memberIdCheckcnt(String uId);
	 * public userVO memberLogin(String uId);
	 */
}
