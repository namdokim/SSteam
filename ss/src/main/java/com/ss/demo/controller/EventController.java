package com.ss.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.demo.domain.EventVO;

import com.ss.demo.service.EventService;

@Controller
@RequestMapping(value="/event")
public class EventController {
	
	@Autowired
	EventService es;
	
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
	
	@RequestMapping(value = "/eventWriteAction.do")
	public String eventWriteAction(EventVO ev,
			@RequestParam("event_title") String event_title,
			@RequestParam("event_content") String event_content
			)
	
	{
		ev.setEvent_title(event_title);
		ev.setEvent_content(event_content);
		
		//HttpSession session = request.getSession();
		System.out.println("event_title : " + event_title);
		System.out.println("event_content : " + event_content);
		int value = es.EventInsert(ev);
		return "redirect:/";
	}
	
	@RequestMapping(value="/eventReviewWrite.do")
	public String eventReviewWrite(){
		
		return "event/eventReviewWrite";
	}
}
