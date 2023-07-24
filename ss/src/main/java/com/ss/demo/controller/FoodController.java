package com.ss.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/food")
public class FoodController {
	
	@RequestMapping(value="/foodMain.do")
	public String foodMain(){
		
		return "food/foodMain";
	}
	
	@RequestMapping(value="/foodView.do")
	public String foodView(){
		
		return "food/foodView";
	}
}
