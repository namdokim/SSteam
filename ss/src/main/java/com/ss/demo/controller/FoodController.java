package com.ss.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.SearchVO;
import com.ss.demo.service.FoodService;

@Controller
@RequestMapping(value="/food")
public class FoodController 
{
	//============================= @Autowired
	@Autowired
	private FoodService foodService;
	//============================= 
	
	
	
	
	
	// ===================================================================== food Main <List> (메인페이지) 
	@RequestMapping(value="/foodMain.do")
	public String foodMain(Model model ,SearchVO searchVO){
		
		String type = null;
		FoodVO vo = new FoodVO();
		vo.setLType(type);
		
		
		
		List<FoodVO> list = foodService.list(searchVO);
		model.addAttribute("list", list);
		return "food/foodMain";

	}
	
	
	
	// ===================================================================== food MainWrite (식당등록 페이지) 
	@RequestMapping(value="/foodMainWrite.do")
	public String foodMainWrite(){
		
		return "food/foodMainWrite";
	}
	
	
	
	
	// ===================================================================== food MenuWrite (메뉴등록 페이지) 
	@RequestMapping(value="/foodMenuWrite.do")
	public String foodMenuWrite(FoodVO vo ,Model model){
		
		model.addAttribute("vo",vo);
		return "food/foodMenuWrite"; 
	}
	

	
	
	// ===================================================================== food View (상세보기 페이지) 
	@RequestMapping(value="/foodView.do")
	public String foodView(int fNo,Model model){
		
		FoodVO vo = foodService.selectOneByFno(fNo);
		model.addAttribute("vo",vo);
		
		List<FoodVO> list = foodService.listMenu(fNo);
		model.addAttribute("list", list);
//		list.get(0);
//		System.out.println(list.get(0).getFood_menu_name());
		return "food/foodView";
	}
	
	
	
	// ===================================================================== food ReviewWrite (리뷰등록 페이지) 
	@RequestMapping(value="/foodReviewWrite.do")
	public String foodReviewWrite(){
		
		return "food/foodReviewWrite";
	}
	
	
	
	
	
	//====================================================================== foodMainWrite,POST (식당 등록,POST) 
	@RequestMapping(value="/foodMainWrite.do",method=RequestMethod.POST)
	public String foodMainWrite(FoodVO foodVO,HttpServletRequest req) {
		
		
		//System.out.println("LType : " + foodVO.getLType());
		System.out.println(foodVO.toString());
		
		HttpSession session = req.getSession();
		int result = foodService.insert(foodVO);
		
		if (result > 0) 
		{
			System.out.println("등록 성공");
		} else 
		{
			System.out.println("등록 실패");
		}
		
		return "redirect:foodView.do?fNo="+foodVO.getfNo();
	}
	
	
	
	
	//====================================================================== foodMenuWrite,POST (메뉴 등록 , POST) 
	@RequestMapping(value="/foodMenuWrite.do",method=RequestMethod.POST)
	public String foodMenuWrite(FoodVO foodVO,HttpServletRequest req) {
		
		HttpSession session = req.getSession();

		int result = foodService.insertMenu(foodVO);
		System.out.println(foodVO.toString());
		
		return "redirect:foodView.do?fNo="+foodVO.getfNo();
	}
	
	
	
	//========================================================================
}
