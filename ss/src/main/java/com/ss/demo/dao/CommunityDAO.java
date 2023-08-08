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
	
	// 전체 게시글 개수 얻기
	public int getBoardCount()
	{
		// 게시글 개수 반환
		return sqlSession.selectOne("com.ss.demo.mapper.CommunityMapper.getBoardCount");
	}
	
	// 특정 게시글 개수 얻기
	public int getBoardCount_TypeChoice(int boardType)
	{
		// 게시글 개수 반환
		return sqlSession.selectOne("com.ss.demo.mapper.CommunityMapper.getBoardCount_TypeChoice", boardType);
	}
	
	// 전체 게시글의 페이지에 대한 게시글 정보 얻기
	public List<Community_BoardVO> getBoardPage(int nowPage)
	{
		// 반환 게시글 리스트
		List<Community_BoardVO> communityBoardList;
		
		// 페이지 당 게시글 개수
		int unitPage = 10;
		
		// 페이지 Limit Offset
		int offset = (nowPage - 1) * unitPage;
		
		// 여러개의 파라미터 전달
		Map<String, Object> params = new HashMap<>();
		params.put("unitPage", unitPage);
	    params.put("offset", offset);	
		
		// SQL 실행
		communityBoardList = sqlSession.selectList("com.ss.demo.mapper.CommunityMapper.getBoardPage", params);
		
		// 게시글 목록 반환
		return communityBoardList;
	}
	
	// 특정 게시글의 페이지에 대한 게시글 정보 얻기
	public List<Community_BoardVO> getBoardPage_TypeChoice(int boardType, int nowPage)
	{
		// 반환 게시글 리스트
		List<Community_BoardVO> communityBoardList;
		
		// 페이지 당 게시글 개수
		int unitPage = 10;
		
		// 페이지 Limit Offset
		int offset = (nowPage - 1) * unitPage;
		
		// 여러개의 파라미터 전달
		Map<String, Object> params = new HashMap<>();
		params.put("unitPage", unitPage);
	    params.put("offset", offset);
	    params.put("boardType", boardType);	
		
		// SQL 실행
		communityBoardList = sqlSession.selectList("com.ss.demo.mapper.CommunityMapper.getBoardPage_TypeChoice", params);
		
		// 게시글 목록 반환
		return communityBoardList;
	}
}
