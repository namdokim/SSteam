package com.ss.demo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.demo.dao.CommunityDAO;
import com.ss.demo.domain.Community_BoardVO;

@Service
public class CommunityServiceImpl implements CommunityService
{
	@Autowired
	private CommunityDAO communityDAO;
	
	// 게시글 등록
	@Override
	public void insertBoard(Community_BoardVO communityBoardVO)
	{
		communityDAO.insertBoard(communityBoardVO);
	}
		
	// 전체 게시글 개수 얻기
	@Override
	public int getBoardCount()
	{
		return communityDAO.getBoardCount();
	}
	
	// 특정 게시글 개수 얻기
	@Override
	public int getBoardCount_TypeChoice(int boardType)
	{
		return communityDAO.getBoardCount_TypeChoice(boardType);
	}
	
	// 페이지에 대한 게시글 정보 얻기
	@Override
	public List<Community_BoardVO> getBoardPage(int boardType, int nowPage)
	{
		return communityDAO.getBoardPage(boardType, nowPage);
	}
}