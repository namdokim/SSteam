package com.ss.demo.persistence;

import java.util.List;

import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.EventReviewVO;
import com.ss.demo.domain.EventVO;
import com.ss.demo.domain.Event_LikeVO;
import com.ss.demo.domain.SearchVO;



public interface EventService_Mapper {
	
	
	
	
	// ==================================================== 조회
	
//	List<EventVO> selectAll(SearchVO searchVO);	
	public List<EventVO> selectAll_event_attach(int event_number);
	public List<EventReviewVO> selectAll_review(int comment_number);
//	public List<EventVO> selectAll(Criteria cri);
	List<EventVO> selectAll_event(EventVO ev);
	public EventVO selectOneByevent_number(int event_number);
	public int select_event_count();

	int dupl_like(Event_LikeVO likeVO);
//	double selectAvg_eventreview(int event_number); 	
	int selectAllCount_eventreview(int event_number);
	int selectCount_eventreview(EventReviewVO erv);
	public EventReviewVO selectOneBycomment_number(int comment_number);
	
	// ==================================================== 추가  
	
	
	public int EventInsert(EventVO ev);
	public int insert_file(EventVO ev);
	public int insert_review(EventReviewVO erv);
	int insert_like(Event_LikeVO likeVO);
	
	
	// ==================================================== 수정 
	public int update(EventVO ev);
	public int init_attach_thumbnail(int event_number);
	public int update_review(EventReviewVO erv);
	public int attach_thumbnail(int attach_number);
	
	
	
	// ==================================================== 삭제 
	public int delete_event(int event_number);
	public int delete_attach(int attach_number);
	public int delete_review(int comment_number);
	public int delete_like(Event_LikeVO likeVO);
	
	

	



	

	




}
