package com.ss.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.demo.dao.RentalhomeDAO;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.Rentalhome_LikeVO;
import com.ss.demo.domain.Rentalhome_PayVO;
import com.ss.demo.domain.Rentalhome_ReviewVO;
import com.ss.demo.domain.Rentalhome_Review_ReportVO;
import com.ss.demo.domain.Rentalhome_RoomVO;
import com.ss.demo.domain.Rentalhome_SearchVO;

@Service
public class RentalhomeServiceImpl implements RentalhomeService{

	
	@Autowired
	private RentalhomeDAO rentalhomeDAO;
	
	@Override
	public int insert(RentalhomeVO rentalhomeVO) {
		return rentalhomeDAO.insert(rentalhomeVO);
	}

	@Override
	public List<RentalhomeVO> selectAll(Rentalhome_SearchVO searchVO) {
		return rentalhomeDAO.selectAll(searchVO);
	}

	@Override
	public RentalhomeVO selectOneByIdx(int rentalhome_idx) {
		
		return rentalhomeDAO.selectOneByIdx(rentalhome_idx);
	}
	
	@Override
	public int update(RentalhomeVO rentalhomeVO) {
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

	@Override
	public int insert_room(Rentalhome_RoomVO roomVO) {
		
		return rentalhomeDAO.insert_room(roomVO);
	}

	@Override
	public int insert_room_file(Rentalhome_RoomVO roomVO) {
		
		return rentalhomeDAO.insert_room_file(roomVO);
	}

	@Override
	public List<Rentalhome_RoomVO> selectAll_room(Rentalhome_SearchVO searchVO) {
		
		return rentalhomeDAO.selectAll_room(searchVO);
	}

	@Override
	public Rentalhome_RoomVO selectOneByIdx_room(int room_idx) {
		
		return rentalhomeDAO.selectOneByIdx_room(room_idx);
	}

	@Override
	public int update_room(Rentalhome_RoomVO roomVO) {
		
		return rentalhomeDAO.update_room(roomVO);
	}

	@Override
	public int delete_room(int room_idx) {
		
		return rentalhomeDAO.delete_room(room_idx);
	}

	@Override
	public List<RentalhomeVO> selectAll_rentalhome_attach(int rentalhome_idx) {
			
		return rentalhomeDAO.selectAll_rentalhome_attach(rentalhome_idx);
	}

	@Override
	public int init_attach_thumbmail(int rentalhome_idx) {
		
		return rentalhomeDAO.init_attach_thumbnail(rentalhome_idx);
	}

	@Override
	public int attach_thumbmail(int attach_idx) {
		
		return rentalhomeDAO.attach_thumbnail(attach_idx);
	}

	@Override
	public List<Rentalhome_RoomVO> selectAll_room_attach() {
		
		return rentalhomeDAO.selectAll_room_attach();
	}

	@Override
	public int delete_attach(int attach_idx) {
		
		return rentalhomeDAO.delete_attach(attach_idx);
	}

	@Override
	public int select_rentalhome_count() {
		
		return rentalhomeDAO.select_rentalhome_count();
	}

	@Override
	public int insert_like(Rentalhome_LikeVO likeVO) {
		
		return rentalhomeDAO.insert_like(likeVO);
	}

	@Override
	public int select_like(int rentalhome_idx) {
		
		return rentalhomeDAO.select_like(rentalhome_idx);
	}

	@Override
	public int dupl_like(Rentalhome_LikeVO likeVO) {
		
		return rentalhomeDAO.dupl_like(likeVO);
	}

	@Override
	public int delete_like(Rentalhome_LikeVO likeVO) {
		
		return rentalhomeDAO.delete_like(likeVO);
	}

	@Override
	public int init_attach_room_thumbmail(int room_idx) {
		
		return rentalhomeDAO.init_attach_room_thumbnail(room_idx);
	}

	@Override
	public int room_attach_thumbmail(int attach_idx) {
		
		return rentalhomeDAO.room_attach_thumbnail(attach_idx);
	}

	@Override
	public int room_attach_delete(int attach_idx) {
		
		return rentalhomeDAO.room_attach_delete(attach_idx);
	}

	@Override
	public List<Rentalhome_RoomVO> selectAll_room_attach_ByIdx(int room_idx) {
		
		return rentalhomeDAO.selectAll_room_attach_ByIdx(room_idx);
	}

	@Override
	public int insert_pay(Rentalhome_PayVO rentalhome_payVO) {
			
		return rentalhomeDAO.insert_pay(rentalhome_payVO);
	}

	@Override
	public Rentalhome_PayVO selectOneByReserve_number(String reserve_number) {
		
		return rentalhomeDAO.selectOneByReserve_number(reserve_number);
	}

	@Override
	public List<Rentalhome_PayVO> selectAll_reserve(int uNo) {
		
		return rentalhomeDAO.selectAll_reserve(uNo);
	}

	@Override
	public int update_pay_refund(Rentalhome_PayVO rentalhome_payVO) {
		
		return rentalhomeDAO.update_pay_refund(rentalhome_payVO);
	}

	@Override
	public int insert_review(Rentalhome_ReviewVO reviewVO) {
	
		return rentalhomeDAO.insert_review(reviewVO);
	}

	@Override
	public int update_pay_reviewYN(String reserve_number) {
		
		return rentalhomeDAO.update_pay_reviewYN(reserve_number);
	}

	@Override
	public int select_review_count(int rentalhome_idx) {
		
		return rentalhomeDAO.select_review_count(rentalhome_idx);
	}

	@Override
	public Rentalhome_ReviewVO select_review_avg(int rentalhome_idx) {
		
		return rentalhomeDAO.select_review_avg(rentalhome_idx);
	}

	@Override
	public List<Rentalhome_ReviewVO> selectAll_review(int rentalhome_idx) {
		return rentalhomeDAO.selectAll_review(rentalhome_idx);
	}

	@Override
	public int delete_review(int review_idx) {
		
		return rentalhomeDAO.delete_review(review_idx);
	}

	@Override
	public int update_review(Rentalhome_ReviewVO reviewVO) {
		
		return rentalhomeDAO.update_review(reviewVO);
	}

	@Override
	public int insert_review_report(Rentalhome_Review_ReportVO reportVO) {
		
		return rentalhomeDAO.insert_review_report(reportVO);
	}

	@Override
	public int update_review_status(int room_idx) {
		
		return rentalhomeDAO.update_review_status(room_idx);
	}
	
}
