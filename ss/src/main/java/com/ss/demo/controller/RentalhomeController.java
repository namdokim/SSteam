package com.ss.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/rentalhome")
public class RentalhomeController {
	
	@RequestMapping(value="/rentalhomeMain.do")
	public String rentalhomeMain(){
		
		return "rentalhome/rentalhomeMain";
	}
	
	@RequestMapping(value="/rentalhomeView.do")
	public String rentalhomeView(){
		
		return "rentalhome/rentalhomeView";
	}

	@RequestMapping(value="/rentalhomeWrite.do", method=RequestMethod.GET)
	public String rentalhomeWrite(){
		
		return "rentalhome/rentalhomeWrite";
	}
	
	@RequestMapping(value="/rentalhomeWrite_room.do", method=RequestMethod.GET)
	public String rentalhomeWrite_room(){
		
		return "rentalhome/rentalhomeWrite_room";
	}

	@RequestMapping(value="/rentalhomeReserve.do", method=RequestMethod.GET)
	public String rentalhomeReserve(){
		
		return "rentalhome/rentalhomeReserve";
	}
	
}
