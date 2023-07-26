package com.ss.demo.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.demo.domain.UserVO;
import com.ss.demo.persistence.UserService_Mapper;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService{
	
	//마이바티스에서  사용할 메소드 집합 
	private UserService_Mapper usm;
	// 맵퍼 불러오기 
	@Autowired
	public UserServiceImpl(SqlSession sqlSession) {
		this.usm = sqlSession.getMapper(UserService_Mapper.class);
	}
	// 유저 회원가입 
	@Override
	public int userInsert(UserVO uv) {
		// TODO Auto-generated method stub
		
		int value = usm.userInsert(uv);
		System.out.println("user"+value);
		return value;
	}
	//유저 로그인
	@Override
	public UserVO userlogin(UserVO uv)
	{
		
		uv = usm.userlogin(uv);
		System.out.println("sql"+uv);
		return uv;
	}
	// 유저 닉네임 중복체크 
	@Override
	public int uNickCheck(String uNick)
	{
		int value = usm.uNickCheck(uNick);
		return value;
	}
	// 유저 id 중복체크
	@Override
	public int uIdCheck(String uId) {
		//
		int value = usm.uIdCheck(uId);
		return value;
	}
	@Override
	public UserVO uPwCheck(String uId) {
		UserVO value = usm.uPwCheck(uId);
		return value;
	}
	//유저 조회
	@Override
	public UserVO userONE(String uId) {
		UserVO uv = usm.userONE(uId);
		return uv;
	}


}
