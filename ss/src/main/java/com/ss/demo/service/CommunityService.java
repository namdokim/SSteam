
package com.ss.demo.service;

import java.util.List;

import com.ss.demo.domain.Community_BoardVO;

public interface CommunityService
{
	// 게시글 등록
	public void insertBoard(Community_BoardVO communityBoardVO);
	
	// 전체 게시글 개수 얻기
	public int getBoardCount();
	// 특정 게시글 개수 얻기
	public int getBoardCount_TypeChoice(int boardType);
	// 전체 게시글의 페이지에 대한 게시글 정보 얻기
	public List<Community_BoardVO> getBoardPage(int nowPage);
	// 특정 게시글의 페이지에 대한 게시글 정보 얻기
	public List<Community_BoardVO> getBoardPage_TypeChoice(int boardType, int nowPage);
}