package com.ss.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.demo.dao.RentalhomeDAO;
import com.ss.demo.domain.RentalhomeVO;

@Service
public class RentalhomeServiceImpl implements RentalhomeService{

	
	@Autowired
	private RentalhomeDAO rentalhomeDAO;
	
	@Override
	public int insert(RentalhomeVO rentalhomeVO) {
		return rentalhomeDAO.insert(rentalhomeVO);
	}

	@Override
	public List<RentalhomeVO> selectAll() {
		
		return rentalhomeDAO.selectAll();
	}

	@Override
	public RentalhomeVO selectOneByIdx(int rentalhome_idx) {
		
		return rentalhomeDAO.selectOneByIdx(rentalhome_idx);
	}

	@Override
	public int update(RentalhomeVO rentalhomeVO) {
		System.out.println("서비스 구현체 진입");
		return rentalhomeDAO.update(rentalhomeVO);
	}

	@Override
	public int insert_file(RentalhomeVO rentalhomeVO) {
		
		return rentalhomeDAO.insert_file(rentalhomeVO);
	}

	@Override
	public int delete_rentalhome(int rentalhome_idx) {
		
		return rentalhomeDAO.delete_rentalhome(rentalhome_idx);
	}
	
}
