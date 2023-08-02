package com.ss.demo.service;

import java.util.List;

import com.ss.demo.domain.RentalhomeVO;

public interface RentalhomeService {
	
	public int insert(RentalhomeVO rentalhomeVO);

	public List<RentalhomeVO> selectAll();

	public RentalhomeVO selectOneByIdx(int rentalhome_idx);

	public int update(RentalhomeVO rentalhomeVO);

	public int insert_file(RentalhomeVO rentalhomeVO);
}
