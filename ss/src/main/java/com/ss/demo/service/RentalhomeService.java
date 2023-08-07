package com.ss.demo.service;

import java.util.List;

import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.RoomVO;

public interface RentalhomeService {
	
	public int insert(RentalhomeVO rentalhomeVO);

	public List<RentalhomeVO> selectAll();

	public List<RentalhomeVO> selectAll_rentalhome_attach(int rentalhome_idx);


	public RentalhomeVO selectOneByIdx(int rentalhome_idx);

	public int update(RentalhomeVO rentalhomeVO);
	
	public int delete_rentalhome(int rentalhome_idx);

	public int insert_file(RentalhomeVO rentalhomeVO);

	public int insert_room(RoomVO roomVO);
	
	public int insert_room_file(RoomVO roomVO);
	
	public List<RoomVO>selectAll_room(int rentalhome_idx);

	public RoomVO selectOneByIdx_room(int room_idx);
	
	public int update_room(RoomVO roomVO);

	public int delete_room(int room_idx);

	public int init_attach_thumbmail(int rentalhome_idx);
	
	public int attach_thumbmail(int attach_idx);

	public List<RoomVO> selectAll_room_attach();

	public int delete_attach(int attach_idx);
}
