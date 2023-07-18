package com.ss.demo.persistence;

import com.ss.demo.domain.UserVO;


public interface UserService_Mapper {

	public int userInsert(UserVO uv);
	public UserVO userlogin(String uId);
	public int uNickCheck(String uNick);
	/*
	 * public userVO login(String uId); public int memberIdCheckcnt(String uId);
	 * public userVO memberLogin(String uId);
	 */
}
