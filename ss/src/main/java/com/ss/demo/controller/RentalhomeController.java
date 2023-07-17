package com.ss.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/rentalhome")
public class RentalhomeController {
	
	@RequestMapping(value="/rentalhomeMain.do")
	public String rentalhomeMain(){
		
		return "rentalhome/rentalhomeMain1";
	}
	
	@RequestMapping(value="/rentalhomeView.do")
	public String rentalhomeView(){
		
		return "rentalhome/rentalhomeView";
	}
	
}
