package com.ss.demo.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.SearchVO;

@Repository
public class FoodDAO {
	
	
	//============================ @Autowired sqlSession
	@Autowired
	private SqlSession sqlSession;
	//============================
	
	
	// 식당 등록 
	public int insert(FoodVO vo) {
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert", vo);
	}
	
	// 식당 리스트 불러오기 (list)
	public List<FoodVO> list(SearchVO searchVO) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll",searchVO);
	}
	
	// selectOneByFno 
	public FoodVO selectOneByFno(int fNo) {
		return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectOneByFno",fNo);
	}
	
	
	// 메뉴 등록 (insert Menu) 
	public int insertMenu(FoodVO vo) {
		System.out.println(vo.getfNo());
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insertMenu", vo);
	}
	
	// 메뉴 리스트 불러오기 (list Menu)
	public List<FoodVO> listMenu(int fNo) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAllMenu", fNo);
	}

	// 파일 업로드 
	public int insert_file(FoodVO vo) {
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert_file_attach", vo);
	}
	
	// 파일 불러오기 
	public List<FoodVO> selectAttach(FoodVO vo) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAttach", vo);
	}

	// 식당 업데이트
	public int update(FoodVO vo) {
		System.out.println("DAO 진입");
		return sqlSession.update("com.ss.demo.mapper.foodMapper.update", vo);
	}
	
}

