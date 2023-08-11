package com.ss.demo.service;

import java.util.List;

import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.Rentalhome_LikeVO;
import com.ss.demo.domain.Rentalhome_RoomVO;

public interface RentalhomeService {
	
	public int insert(RentalhomeVO rentalhomeVO);

	public List<RentalhomeVO> selectAll(Criteria cri);

	public List<RentalhomeVO> selectAll_rentalhome_attach(int rentalhome_idx);

	public List<Rentalhome_RoomVO> selectAll_room_attach_ByIdx(int room_idx);

	public RentalhomeVO selectOneByIdx(int rentalhome_idx);

	public int update(RentalhomeVO rentalhomeVO);
	
	public int delete_rentalhome(int rentalhome_idx);

	public int select_rentalhome_count();

	public int insert_file(RentalhomeVO rentalhomeVO);

	public int insert_room(Rentalhome_RoomVO roomVO);

	public int insert_review(Rentalhome_RoomVO roomVO);
	
	public int insert_room_file(Rentalhome_RoomVO roomVO);
	
	public List<Rentalhome_RoomVO>selectAll_room(int rentalhome_idx);

	public Rentalhome_RoomVO selectOneByIdx_room(int room_idx);
	
	public int update_room(Rentalhome_RoomVO roomVO);

	public int delete_room(int room_idx);

	public int init_attach_thumbmail(int rentalhome_idx);
	
	public int attach_thumbmail(int attach_idx);

	public int init_attach_room_thumbmail(int room_idx);
	
	public int room_attach_thumbmail(int attach_idx);

	public List<Rentalhome_RoomVO> selectAll_room_attach();

	public int delete_attach(int attach_idx);

	public int room_attach_delete(int attach_idx);

	public int insert_like(Rentalhome_LikeVO likeVO);
	
	public int select_like(int rentalhome_idx);

	public int dupl_like(Rentalhome_LikeVO likeVO);

	public int delete_like(Rentalhome_LikeVO likeVO);
}
