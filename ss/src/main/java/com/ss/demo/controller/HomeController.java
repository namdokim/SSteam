package com.ss.demo.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.demo.domain.EventVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.Rentalhome_SearchVO;
import com.ss.demo.domain.SearchVO;
import com.ss.demo.service.EventService;
import com.ss.demo.service.FoodService;
import com.ss.demo.service.RentalhomeService;


@Controller
public class HomeController {
	
	@Autowired
	RentalhomeService rs;

	@Autowired
	FoodService fs;
	
	@Autowired
	EventService es;
	
	private static int sNum = 0;
	private static int perPage = 10;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Rentalhome_SearchVO rentalhome_searchVO = new Rentalhome_SearchVO();
		rentalhome_searchVO.setsNum(sNum);
		rentalhome_searchVO.setPerPageNum(perPage);
		rentalhome_searchVO.setSort("like");
		List<RentalhomeVO> list_rentalhome = rs.selectAll(rentalhome_searchVO);
		model.addAttribute("rentalhome_list", list_rentalhome);
		
		for(int i=0; i<list_rentalhome.size(); i++){
			System.out.println(list_rentalhome.get(i).toString());
		}
		SearchVO searchVO = new SearchVO();
		searchVO.setsNum(sNum);
		searchVO.setPerPageNum(perPage);
		List<FoodVO> list_food = fs.selectAll(searchVO);
		model.addAttribute("food_list", list_food);

		List<EventVO> list_event = es.selectAll(searchVO);
		model.addAttribute("event_list", list_event);
		
		
		return "User/index";
	}
	
	//리다이렉트로 안 돌리면은 이미지가 안 나옴 ㄷㄷ
	// 메인 홈 화면으로 돌아갈떄 
	@RequestMapping(value="reHome.do")
	public String reHome()
	{
		return "redirect:/";
	}
}
