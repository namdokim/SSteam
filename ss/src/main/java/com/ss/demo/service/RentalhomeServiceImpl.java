package com.ss.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.demo.dao.RentalhomeDAO;
import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.RoomVO;

@Service
public class RentalhomeServiceImpl implements RentalhomeService{

	
	@Autowired
	private RentalhomeDAO rentalhomeDAO;
	
	@Override
	public int insert(RentalhomeVO rentalhomeVO) {
		return rentalhomeDAO.insert(rentalhomeVO);
	}

	@Override
	public List<RentalhomeVO> selectAll(Criteria cri) {
//		cri.setsNum((cri.getPage()-1)*cri.getPerPageNum());
		return rentalhomeDAO.selectAll(cri);
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
	public int insert_room(RoomVO roomVO) {
		
		return rentalhomeDAO.insert_room(roomVO);
	}

	@Override
	public int insert_room_file(RoomVO roomVO) {
		
		return rentalhomeDAO.insert_room_file(roomVO);
	}

	@Override
	public List<RoomVO> selectAll_room(int rentalhome_idx) {
		
		return rentalhomeDAO.selectAll_room(rentalhome_idx);
	}

	@Override
	public RoomVO selectOneByIdx_room(int room_idx) {
		
		return rentalhomeDAO.selectOneByIdx_room(room_idx);
	}

	@Override
	public int update_room(RoomVO roomVO) {
		
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
	public List<RoomVO> selectAll_room_attach() {
		
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
	
}
