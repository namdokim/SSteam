package com.ss.demo.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ss.demo.dao.FoodDAO;
import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.FoodReviewVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.SearchVO;


@Service
public class FoodServiceImpl implements FoodService {

	
	//============================ @Autowired foodDAO
	@Autowired
	private FoodDAO foodDAO;
	//============================
	
	@Override
	public int insert(FoodVO vo) {
		return foodDAO.insert(vo);
	}

	@Override
	public FoodVO selectOneByFno(int fNo) {
		return foodDAO.selectOneByFno(fNo);
	}


	//============================== insert Menu()
	@Override
	public int insertMenu(FoodVO vo) {
		return foodDAO.insertMenu(vo);
	}

	@Override
	public List<FoodVO> listMenu(int fNo) {
		return foodDAO.listMenu(fNo);
	}

	//============================== insert Img()
	@Override
	public int insert_file(FoodVO vo) {
		return foodDAO.insert_file(vo);
	}

	@Override
	public int update(FoodVO vo) {
		return foodDAO.update(vo);
	}

	@Override
	public int delete(int fNo) {
		return foodDAO.delete(fNo);
	}

	//========================================
	@Override
	public List<FoodVO> selectListByFno(int fNo) {
		return foodDAO.selectListByFno(fNo);
	}

	//======================================== 페이징 
	@Override
	public int select_food_count() {
		return foodDAO.select_food_count();
	}

	@Override
	public List<FoodVO> list(SearchVO searchVO) {
		return foodDAO.list(searchVO);
	}

	//======================================= 첨부파일 수정 
	@Override
	public int init_attach_thumbmail(int fNo) {
		return foodDAO.init_attach_thumbnail(fNo);
	}

	@Override
	public int attach_thumbmail(int food_attach_number) {
		return foodDAO.attach_thumbnail(food_attach_number);
	}

	@Override
	public int delete_attach(int food_attach_number) {
		return foodDAO.delete_attach(food_attach_number);
	}

	@Override
	public List<FoodVO> selectAll_food_attach(int fNo) {
		return foodDAO.selectAll_food_attach(fNo);
	}

	@Override
	public int insert(FoodReviewVO vo) {
		return foodDAO.insert(vo);
	}

	@Override
	public List<FoodReviewVO> list() {
		return foodDAO.list();
	}

	@Override
	public FoodReviewVO selectOneByFRno(int food_review_number) {
		return foodDAO.selectOneByFRno(food_review_number);
	}

	@Override
	public int delete_foodreview(int food_review_number) {
		return foodDAO.delete_foodreview(food_review_number);
	}

	@Override
	public int modify_foodreview(FoodReviewVO foodreviewVO) {
		return foodDAO.modify_foodreview(foodreviewVO);
	}




}