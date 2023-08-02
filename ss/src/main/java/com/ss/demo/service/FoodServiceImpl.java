package com.ss.demo.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ss.demo.dao.FoodDAO;
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

	@Override
	public List<FoodVO> list(SearchVO searchVO) {
		return foodDAO.list(searchVO);
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




}
