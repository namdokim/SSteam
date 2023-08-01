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

import com.ss.demo.domain.Community_BoardVO;
import com.ss.demo.service.CommunityService;

@RequestMapping (value = "/Community")
@Controller
public class CommunityController
{
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping (value = "/ChattingTest.do")
	public String toChattingTest()
	{
		return "Community/ChattingTest";
	}
	
	@RequestMapping (value = "/CommunityMain.do")
	public String toCommunityMain(@RequestParam(name = "nowPage", defaultValue = "0") int nowPage,
            					  @RequestParam(name = "selectBoardType", defaultValue = "0") int selectBoardType,
            					  Model model)
	{
		// url 에 현재 선택 된 게시판의 게시글 저장
		List<Community_BoardVO> nowPageBoardList = communityService.getBoardPage(nowPage, selectBoardType);
		model.addAttribute("nowPageBoardList", nowPageBoardList);
		System.out.println(nowPageBoardList);
		
		return "Community/CommunityMain";
	}
	
	@RequestMapping (value = "/CommunityWrite.do")
	public String toCommunityWrite()
	{
		return "Community/CommunityWrite";
	}
	
	@RequestMapping (value = "/CommunityWriteCheck.do", method=RequestMethod.POST)
	public String communityWriteCheck(Community_BoardVO communityBoardVO, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		
		/*
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		if(loginVO == null)
		{
			return "redirect:CommunityMain.do";
		}
		
		boardVO.setId(loginVO.getId());
		*/
		
		communityService.insertBoard(communityBoardVO);
		
		System.out.println(communityBoardVO.toString());
		
		return "redirect:CommunityMain.do";
	}
}