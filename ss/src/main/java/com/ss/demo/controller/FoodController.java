package com.ss.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/food")
public class FoodController {
	
	// foodMain
	@RequestMapping(value="/foodMain.do")
	public String foodMain(){
		
		return "food/foodMain";
	}
	
	// foodMainWrite
	@RequestMapping(value="/foodMainWrite.do")
	public String foodMainWrite(){
		
		return "food/foodMainWrite";
	}
	// foodView
	@RequestMapping(value="/foodView.do")
	public String foodView(){
		
		return "food/foodView";
	}
	
	// foodReviewWrite
	@RequestMapping(value="/foodReviewWrite.do")
	public String foodReviewWrite(){
		
		return "food/foodReviewWrite";
	}
	//

}
