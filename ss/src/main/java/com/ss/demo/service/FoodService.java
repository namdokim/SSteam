package com.ss.demo.service;

import java.util.List;


import com.ss.demo.domain.FoodReviewVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.Food_LikeVO;
import com.ss.demo.domain.SearchVO;

public interface FoodService 
{
	// ==================================================== 조회 
	FoodVO selectOneByFno(int fNo);	 						// 특정 fNo 값을 가진 FoodVO를 조회하는 메서드
	List<FoodVO> selectListByFno(int fNo);					// 특정 fNo 값을 가진 FoodVO 목록을 조회하는 메서드
	List<FoodVO> listMenu(int fNo);							// 특정 fNo 값을 가진 메뉴들을 조회하는 메서드
	List<FoodVO> list(SearchVO searchVO);					// 조건에 따라 FoodVO 목록을 조회하는 메서드
	List<FoodVO> selectAll_food_attach(int fNo);			// 특정 fNo 값을 가진 FoodVO의 첨부 파일 목록을 조회하는 메서드
	FoodReviewVO selectOneByFRno(int food_review_number);	// 특정 fNo 값을 가진 FoodVO 목록을 조회하는 메서드	
	List<FoodReviewVO> list();								// 모든 리뷰 목록을 조회하는 메서드 
	int select_food_count();								// 식당 데이터의 총 개수를 조회하는 메서드 
	int select_like(int fNo);
	int dupl_like(Food_LikeVO likeVO);
	// ==================================================== 추가  
	int insert(FoodVO vo);									// FoodVO 데이터를 추가하는 메서드
	int insertMenu(FoodVO vo);								// 메뉴 데이터를 추가하는 메서드
	int insert_file(FoodVO vo);								// 첨부 파일 데이터를 추가하는 메서드
	int insert(FoodReviewVO vo);							// 모달창에 리뷰 내용을 추가하는 메서드
	int insert_like(Food_LikeVO likeVO);
	// ==================================================== 수정 
	int update(FoodVO foodVO);								//FoodVO 데이터를 수정하는 메서드
	int init_attach_thumbmail(int fNo);						// 첨부 파일의 썸네일 초기화하는 메서드
	int attach_thumbmail(int food_attach_number);			// 첨부 파일의 썸네일 설정하는 메서드
	int modify_foodreview(FoodReviewVO foodreviewVO);		//리뷰 데이터를 수정하는 메서드
	
	// ==================================================== 삭제 
	int delete(int fNo);									// 특정 fNo 값을 가진 FoodVO 데이터를 삭제하는 메서드
	int delete_attach(int food_attach_number);				// 첨부 파일 데이터를 삭제하는 메서드
	int delete_foodreview(int food_review_number);			// 특정 food_review_number 값을 가진 리뷰 데이터를 삭제하는 메서드
	int delete_like(Food_LikeVO likeVO);
}