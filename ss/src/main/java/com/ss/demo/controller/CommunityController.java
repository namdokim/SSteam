package com.ss.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.demo.domain.Community_BoardVO;
import com.ss.demo.service.CommunityService;

@RequestMapping (value = "/Community")
@Controller
public class CommunityController
{
	@Autowired
	private CommunityService communityService;
	
	// 페이지당 게시글 개수
	int unitPage = 10;
	// 페이징 블럭 크기
	int pagingBlockSize = 10;
	
	@RequestMapping (value = "/ChattingTest.do")
	public String toChattingTest()
	{
		return "Community/ChattingTest";
	}
	
	@RequestMapping (value = "/CommunityMain.do")
	public String toCommunityMain(@RequestParam(name = "boardType", defaultValue = "0") int boardType,
								  @RequestParam(name = "nowPage", defaultValue = "1") int nowPage,
            					  Model model)
	{
		// 게시글 개수 얻기
		int boardCount = 0;
		if (boardType == 0)
		{
			System.out.println("전체 게시글 개수 얻기");
			boardCount = communityService.getBoardCount();
		}
		else
		{
			System.out.println("특정 게시글 개수 얻기");
			boardCount = communityService.getBoardCount_TypeChoice(boardType);
		}
		
		// url 에 현재 선택 된 게시판의 게시글 저장
		List<Community_BoardVO> nowPageBoardList = communityService.getBoardPage(boardType, nowPage);
		model.addAttribute("nowPageBoardList", nowPageBoardList);
			
		// 최대 페이지 번호 계산
		int maxPage = (boardCount - 1) / unitPage + 1;
		// 페이징 블럭의 시작번호와 끝번호 계산
		int pageStart = ((nowPage - 1) / unitPage) * unitPage + 1;
		int pageEnd = pageStart + pagingBlockSize - 1;
		if (pageEnd > maxPage)
		{
			pageEnd = maxPage;
		}
		
		System.out.println("boardType: " + boardType);
		System.out.println("nowPage: " + nowPage);
		System.out.println("boardCount: " + boardCount);
		System.out.println("maxPage: " + maxPage);
		System.out.println("pageStart: " + pageStart);		
		System.out.println("pageEnd: " + pageEnd);

		// 모델에 파라미터 전달
		model.addAttribute("unitPage", unitPage);
		model.addAttribute("pagingBlockSize", pagingBlockSize);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("boardType", boardType);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageStart", pageStart);
		model.addAttribute("pageEnd", pageEnd);
		model.addAttribute("boardCount", boardCount);
		
		return "Community/CommunityMain";
	}
	
	@RequestMapping (value = "/CommunityWrite.do")
	public String toCommunityWrite(@RequestParam(name = "boardType", defaultValue = "2") int boardType,
								   Model model)
	{
		model.addAttribute("boardType", boardType);
		
		return "Community/CommunityWrite";
	}
	
	@RequestMapping (value = "/CommunityWriteCheck.do", method = RequestMethod.POST)
	public String communityWriteCheck(Community_BoardVO communityBoardVO, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		System.out.println("user_number: " + req.getParameter("user_number"));
		System.out.println("board_title: " + req.getParameter("board_title"));
		System.out.println("board_type: " + req.getParameter("board_type"));
		System.out.println("board_content: " + req.getParameter("board_content"));
		
		/*
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		if(loginVO == null)
		{
			return "redirect:CommunityMain.do";
		}
		
		boardVO.setId(loginVO.getId());
		*/
		
		communityService.insertBoard(communityBoardVO);
		
		return "redirect:CommunityMain.do";
	}
}