package com.ss.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/event")
public class EventController {
	
	@RequestMapping(value="/eventMain.do")
	public String eventMain(){
		
		return "event/eventMain";
	}
	
	@RequestMapping(value="/eventView.do")
	public String eventView(){
		
		return "event/eventView";
	}
	
	@RequestMapping(value="/eventWrite.do")
	public String eventWrite(){
		
		return "event/eventWrite";
	}
}
