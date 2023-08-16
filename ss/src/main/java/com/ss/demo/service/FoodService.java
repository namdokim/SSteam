package com.ss.demo.service;

import java.util.List;


import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.FoodReviewVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.SearchVO;

//================================================
public interface FoodService {


	
	//=================================================
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

	// delete
	int delete(int fNo);
	
	// list MenuAttach()
	List<FoodVO> selectListByFno(int fNo);

	
	//=================================================
	// + 페이징 
	List<FoodVO> list(SearchVO searchVO);
	
	List<FoodVO> selectAll_food_attach(int fNo);
	
	int select_food_count();
	
	//================================================== 첨부파일 수정 
	public int init_attach_thumbmail(int fNo);
	
	public int attach_thumbmail(int food_attach_number);

	int delete_attach(int food_attach_number);
	
	
	//=================================================
	// 모달창 리뷰 내용넣음 
	int insert(FoodReviewVO vo);
	
	List<FoodReviewVO> list();
	
	//=================== ajax 리뷰 
	FoodReviewVO selectOneByFRno(int food_review_number);
	
	// delete_foodreview
	int delete_foodreview(int food_review_number);
	
	// modify_foodreview
	int modify_foodreview(FoodReviewVO foodreviewVO);
	
}