package com.ss.demo.service;

import java.util.List;


import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.SearchVO;


//================================================
public interface FoodService {

	
	List<FoodVO> list(SearchVO searchVO);
	
	FoodVO selectOneByFno(int fNo);
	
	int insert(FoodVO vo);

	// list Menu()
	List<FoodVO> listMenu(int fNo);
	
	// insert Menu()
	int insertMenu(FoodVO vo);

	// insert Img()
	int insert_file(FoodVO vo);

	// update 식당 
	int update(FoodVO foodVO);
	
	
}