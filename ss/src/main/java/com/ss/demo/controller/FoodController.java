package com.ss.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/Food")
public class FoodController {
	
	@RequestMapping(value="/FoodMain.do")
	public String rentalhomeMain(){
		
		return "Food/FoodMain";
	}
	
	@RequestMapping(value="/FoodView.do")
	public String rentalhomeView(){
		
		return "Food/FoodView";
	}
	
}
