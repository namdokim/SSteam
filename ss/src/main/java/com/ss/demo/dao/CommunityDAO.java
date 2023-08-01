package com.ss.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.Community_BoardVO;

@Repository
public class CommunityDAO
{
	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 등록
	public void insertBoard(Community_BoardVO communityBoardVO)
	{
		sqlSession.insert("com.ss.demo.mapper.CommunityMapper.insertBoard", communityBoardVO);
	}
	
	// 페이지에 대한 게시글 정보 얻기
	public List<Community_BoardVO> getBoardPage(int nowPage, int selectBoardType)
	{
		// 반환 게시글 리스트
		List<Community_BoardVO> communityBoardList;
		
		// 페이지 당 게시글 개수
		int unitPage = 10;
		
		// 시작 게시글 번호
		int startBoardNumber = nowPage * unitPage;
		
		// 여러개의 파라미터 전달
		Map<String, Object> params = new HashMap<>();
		params.put("unitPage", unitPage);
	    params.put("startBoardNumber", startBoardNumber);
	    params.put("selectBoardType", selectBoardType);	
		
		// SQL 실행
		communityBoardList = sqlSession.selectList("com.ss.demo.mapper.CommunityMapper.getBoardPage", params);
		
		// 게시글 목록 반환
		return communityBoardList;
	}
}
