package com.ss.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping (value = "/Community")
@Controller
public class CommunityController
{
	@RequestMapping (value = "/ChattingTest.do")
	public String toChattingTest()
	{
		return "Community/ChattingTest";
	}
	
	@RequestMapping (value = "/CommunityMain.do")
	public String toCommunityMain()
	{
		return "Community/CommunityMain";
	}
}