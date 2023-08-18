package com.ss.demo.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ss.demo.dao.FoodDAO;
import com.ss.demo.domain.FoodReviewVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.Food_LikeVO;
import com.ss.demo.domain.SearchVO;


@Service
public class FoodServiceImpl implements FoodService 
{
	@Autowired
	private FoodDAO foodDAO;
	
	//================================================== 추가 
	
	// FoodVO 데이터를 추가하는 메서드 구현
	@Override	
	public int insert(FoodVO vo){ 
		return foodDAO.insert(vo); 
	}
	
	// 메뉴 데이터를 추가하는 메서드 구현
	@Override
	public int insertMenu(FoodVO vo){
		return foodDAO.insertMenu(vo); 
	}
	
	// 첨부 파일 데이터를 추가하는 메서드 구현
	@Override
	public int insert_file(FoodVO vo){
		return foodDAO.insert_file(vo); 
	}

	// 모달창에 리뷰 내용을 추가하는 메서드 구현
	@Override
	public int insert(FoodReviewVO vo){
		return foodDAO.insert(vo); 
	}
	
	@Override
	public int insert_like(Food_LikeVO likeVO) {
		return foodDAO.insert_like(likeVO);
	}
	
	//================================================== 조회
	
	// 특정 fNo 값을 가진 FoodVO를 조회하는 메서드 구현
	@Override
	public FoodVO selectOneByFno(int fNo){
		return foodDAO.selectOneByFno(fNo); 
	}

	// 특정 fNo 값을 가진 메뉴들을 조회하는 메서드 구현
	@Override
	public List<FoodVO> listMenu(int fNo){
		return foodDAO.listMenu(fNo); 
	}

	// 특정 fNo 값을 가진 FoodVO 목록을 조회하는 메서드 구현
	@Override
	public List<FoodVO> selectListByFno(int fNo){
		return foodDAO.selectListByFno(fNo); 
	}

	 // 식당 데이터의 총 개수를 조회하는 메서드 구현
	@Override
	public int select_food_count(){
		return foodDAO.select_food_count(); 
	}

	// 조건에 따라 FoodVO 목록을 조회하는 메서드 구현
	@Override
	public List<FoodVO> list(SearchVO searchVO){
		return foodDAO.list(searchVO); 
	}

	// 특정 fNo 값을 가진 FoodVO의 첨부 파일 목록을 조회하는 메서드 구현
	@Override
	public List<FoodVO> selectAll_food_attach(int fNo){
		return foodDAO.selectAll_food_attach(fNo); 
	}
	
	// 모든 리뷰 목록을 조회하는 메서드 구현
	@Override
	public List<FoodReviewVO> list(int fNo){
		return foodDAO.list(fNo); 
	}

	// 특정 food_review_number 값을 가진 FoodReviewVO를 조회하는 메서드 구현
	@Override
	public FoodReviewVO selectOneByFRno(int food_review_number){
		return foodDAO.selectOneByFRno(food_review_number); 
	}
	
	@Override
	public int select_like(int fNo) {
		return foodDAO.select_like(fNo);
	}

	@Override
	public int dupl_like(Food_LikeVO likeVO) {
		return foodDAO.dupl_like(likeVO);
	}
	
	//================================================== 수정 
	
	// FoodVO 데이터를 수정하는 메서드 구현
	@Override
	public int update(FoodVO vo){
		return foodDAO.update(vo); 
	}

	// 첨부 파일의 썸네일 초기화하는 메서드 구현
	@Override
	public int init_attach_thumbmail(int fNo){
		return foodDAO.init_attach_thumbnail(fNo); 
	}

	// 첨부 파일의 썸네일 설정하는 메서드 구현
	@Override
	public int attach_thumbmail(int food_attach_number){
		return foodDAO.attach_thumbnail(food_attach_number); 
	}
	
	// 리뷰 데이터를 수정하는 메서드 구현
	@Override
	public int modify_foodreview(FoodReviewVO foodreviewVO){ 
		return foodDAO.modify_foodreview(foodreviewVO); 
	}
	
	//================================================== 삭제 
	
	// 특정 fNo 값을 가진 FoodVO 데이터를 삭제하는 메서드 구현
	@Override
	public int delete(int fNo){ 
		return foodDAO.delete(fNo); 
	}

	// 첨부 파일 데이터를 삭제하는 메서드 구현
	@Override
	public int delete_attach(int food_attach_number){
		return foodDAO.delete_attach(food_attach_number); 
	}

	// 특정 food_review_number 값을 가진 리뷰 데이터를 삭제하는 메서드 구현
	@Override
	public int delete_foodreview(int food_review_number){
		return foodDAO.delete_foodreview(food_review_number); 
	}

	@Override
	public int delete_like(Food_LikeVO likeVO) {
		return foodDAO.delete_like(likeVO);
	}

}