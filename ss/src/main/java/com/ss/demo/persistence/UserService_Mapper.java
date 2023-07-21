package com.ss.demo.persistence;

import com.ss.demo.domain.UserVO;


public interface UserService_Mapper {

	public int userInsert(UserVO uv);
	public UserVO userlogin(UserVO uv);
	
	public int uNickCheck(String uNick);
	// id 중복체크 
	public int uIdCheck(String uId);
	// 로그인 체크
	public UserVO loginCheck(UserVO uv);
	/*
	 * public userVO login(String uId); public int memberIdCheckcnt(String uId);
	 * public userVO memberLogin(String uId);
	 */
}
