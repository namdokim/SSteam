package com.ss.demo.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.demo.domain.userVO;
import com.ss.demo.persistence.UserService_Mapper;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService{
	
	//마이바티스에서  사용할 메소드 집합 
	private UserService_Mapper usm;
	//
	@Autowired
	public UserServiceImpl(SqlSession sqlSession) {
		this.usm = sqlSession.getMapper(UserService_Mapper.class);
	}
	
	@Override
	public int userInsert(userVO uv) {
		// TODO Auto-generated method stub
		
		int value = usm.userInsert(uv);
		System.out.println("user"+value);
		return value;
	}
	
	public userVO userlogin(String uId)
	{
		userVO uv = null;
		uv = usm.userlogin(uId);
		System.out.println("sql"+uv);
		return uv;
	}
}
