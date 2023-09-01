package com.ss.demo.service;

import java.util.List;

import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.Rentalhome_LikeVO;
import com.ss.demo.domain.Rentalhome_PayVO;
import com.ss.demo.domain.Rentalhome_ReviewVO;
import com.ss.demo.domain.Rentalhome_Review_ReportVO;
import com.ss.demo.domain.Rentalhome_RoomVO;
import com.ss.demo.domain.Rentalhome_SearchVO;

public interface RentalhomeService {
	
	public int insert(RentalhomeVO rentalhomeVO);

	public List<RentalhomeVO> selectAll(Rentalhome_SearchVO searchVO);

	public List<RentalhomeVO> selectAll_rentalhome_attach(int rentalhome_idx);

	public List<Rentalhome_RoomVO> selectAll_room_attach_ByIdx(int room_idx);

	public RentalhomeVO selectOneByIdx(int rentalhome_idx);

	public int update(RentalhomeVO rentalhomeVO);
	
	public int delete_rentalhome(int rentalhome_idx);

	public int select_rentalhome_count();

	public int insert_file(RentalhomeVO rentalhomeVO);

	public int insert_room(Rentalhome_RoomVO roomVO);

	public int insert_review(Rentalhome_ReviewVO reviewVO);
	
	public int insert_room_file(Rentalhome_RoomVO roomVO);
	
	public List<Rentalhome_RoomVO>selectAll_room(Rentalhome_SearchVO searchVO);

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

	public int insert_pay(Rentalhome_PayVO rentalhome_payVO);

	public Rentalhome_PayVO selectOneByReserve_number(String reserver_number);

	public List<Rentalhome_PayVO> selectAll_reserve(int uNo);

	public int update_pay_refund(Rentalhome_PayVO rentalhome_payVO);

	public int update_pay_reviewYN(String reserve_number);

	public int select_review_count(int rentalhome_idx);

	public Rentalhome_ReviewVO select_review_avg(int rentalhome_idx);
	
	public List<Rentalhome_ReviewVO> selectAll_review(int rentalhome_idx);

	public int delete_review(int review_idx);

	public int update_review(Rentalhome_ReviewVO reviewVO);

	public int insert_review_report(Rentalhome_Review_ReportVO reportVO);
	
	public int update_review_status(int room_idx);
}
