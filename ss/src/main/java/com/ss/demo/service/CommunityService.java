
package com.ss.demo.service;

import java.util.List;

import com.ss.demo.domain.Community_BoardVO;

public interface CommunityService
{
	// 게시글 등록
	public void insertBoard(Community_BoardVO communityBoardVO);
		
	// 페이지에 대한 게시글 정보 얻기
	public List<Community_BoardVO> getBoardPage(int nowPage, int selectBoardType);
}