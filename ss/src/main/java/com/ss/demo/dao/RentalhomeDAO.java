package com.ss.demo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.RentalhomeVO;

@Repository
public class RentalhomeDAO {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	// 숙소 등록
	public int insert(RentalhomeVO rentalhomeVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert", rentalhomeVO);
	}

	// 숙소 리스트 불러오기
	public List<RentalhomeVO> selectAll() {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAll");
	}

	// 숙소 VIEW 데이터 
	public RentalhomeVO selectOneByIdx(int rentalhome_idx) {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.selectOneByIdx", rentalhome_idx);
	}

	// 숙소  업데이트 
	public int update(RentalhomeVO rentalhomeVO) {
		System.out.println("DAO 진입");
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update", rentalhomeVO);
	}

	// 파일 업로드 
	public int insert_file(RentalhomeVO rentalhomeVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert_file", rentalhomeVO);
	}

	// 파일 불러오기 
	public List<RentalhomeVO> selectAttach(RentalhomeVO rentalhomeVO) {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAttach", rentalhomeVO);
	}
}
