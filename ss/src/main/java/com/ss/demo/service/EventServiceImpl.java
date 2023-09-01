package com.ss.demo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.demo.dao.EventDAO;
import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.EventReviewVO;
import com.ss.demo.domain.EventVO;
import com.ss.demo.domain.Event_LikeVO;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.Rentalhome_LikeVO;
import com.ss.demo.domain.SearchVO;
import com.ss.demo.persistence.EventService_Mapper;




@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDAO ed;
	//마이바티스에서  사용할 메소드 집합 
	private EventService_Mapper esm;
	// 맵퍼 불러오기 
	@Autowired
	public EventServiceImpl(SqlSession sqlSession) {
		this.esm = sqlSession.getMapper(EventService_Mapper.class);
	}
	
	
	
	//================================================== 추가 
	
	
	@Override
	public int EventInsert(EventVO ev) {
		
		
		int value = esm.EventInsert(ev);
		return value;
	}
	
	@Override
	public int insert_file(EventVO ev) {
		
		return ed.insert_file(ev);
	}

	@Override
	public int insert_review(EventReviewVO erv) {
		return ed.insert_review(erv);
	}
	
	@Override
	public int insert_like(Event_LikeVO likeVO) {
		return ed.insert_like(likeVO);
	}

	//================================================== 조회

	@Override
	public EventVO selectOneByevent_number(int event_number) { 
		
		return ed.selectOneByevent_number(event_number);
		
	}
	
	@Override
	public EventReviewVO selectOneBycomment_number(int comment_number) {
		
		return ed.selectOneBycomment_number(comment_number);
	}
	
	@Override
	public List<EventVO> selectAll_event_attach(int event_number) {
		return ed.selectAll_event_attach(event_number);
	}
	
	@Override
	public List<EventReviewVO> selectAll_review(int event_number) {
		
		return ed.selectAll_review(event_number);
	}
	
	@Override
	public int select_event_count() {
		
		return ed.select_event_count();
	}
	
	@Override
	public List<EventVO> selectAll_event(EventVO ev) {
		
		return ed.selectAll_event(ev);
	}
	
//	@Override
//	public int select_like(int event_number) {
//		return ed.select_like(event_number);
//	}
//	
	/*
	 * @Override public double selectAvg_eventreview(int event_number) { return
	 * ed.selectAvg_eventreview(event_number); }
	 */
	@Override
	public int selectAllCount_eventreview(int event_number) {
		return ed.selectAllCount_eventreview(event_number);
	}
	
	@Override
	public int selectCount_eventreview(EventReviewVO erv) {
		return ed.selectCount_eventreview(erv);
	}
	
	@Override
	public List<EventVO> selectAll(SearchVO searchVO) {
		return ed.selectAll(searchVO);
	}
	
	@Override
	public int dupl_like(Event_LikeVO likeVO) {
		return ed.dupl_like(likeVO);
	}
	
//	@Override
//	public List<EventReviewVO> list(int event_number) {
//		
//		return ed.list(event_number);
//	}
	
	
	//================================================== 수정 

	@Override
	public int update(EventVO ev) { 
		return ed.update(ev);
		
	}
	
	
	@Override
	public int update_review(EventReviewVO erv) {
		return ed.update_review(erv);
	}

	@Override
	public int init_attach_thumbnail(int event_number) {
		
		return ed.init_attach_thumbnail(event_number);
	}
	
	@Override
	public int attach_thumbnail(int attach_idx) {
		
		return ed.attach_thumbnail(attach_idx);
	}
	
	  
	//================================================== 삭제 
	 
	
	@Override
	public int delete_event(int event_number) {
		return ed.delete_event(event_number);
	}

	
	

	@Override
	public int delete_review(int comment_number) {
		return ed.delete_review(comment_number);
	}

	

	@Override
	public int delete_attach(int event_number) {
		
		return ed.delete_attach(event_number);
	}

	@Override
	public int delete_like(Event_LikeVO likeVO) {
		
		return ed.delete_like(likeVO);
	}



	@Override
	public int select_like(int event_number) {
		// TODO Auto-generated method stub
		return 0;
	}

	



//	@Override
//	public int increment_hit(int event_number) {
//		return ed.increment_hit(event_number);
//	}







	









	


	






	
}
