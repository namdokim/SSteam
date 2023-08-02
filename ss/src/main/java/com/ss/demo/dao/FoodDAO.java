package com.ss.demo.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.SearchVO;

@Repository
public class FoodDAO {
	
	
	//============================ @Autowired sqlSession
	@Autowired
	private SqlSession sqlSession;
	//============================
	
	public int insert(FoodVO vo) {
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert", vo);
	}

	public FoodVO selectOneByFno(int fNo) {
		return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectOneByFno",fNo);
	}

	public List<FoodVO> list(SearchVO searchVO) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll",searchVO);
	}
	

	
	//==================================================================insert Menu 
	public int insertMenu(FoodVO vo) {
		System.out.println(vo.getfNo());
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insertMenu", vo);
	}
	
	//===================================================================list Menu
	public List<FoodVO> listMenu(int fNo) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAllMenu", fNo);
	}
	
	
	
}


