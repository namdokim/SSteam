package com.ss.demo.persistence;

import java.util.List;

import com.ss.demo.domain.EventReviewVO;
import com.ss.demo.domain.EventVO;
import com.ss.demo.domain.SearchVO;



public interface EventService_Mapper {
	
	List<EventVO> list(SearchVO searchVO);
	public int EventInsert(EventVO ev);
	EventVO selectOneByevent_number(int event_number);
	int update(EventVO vo);
	int insert(EventVO vo);
	
	public int EventReviewinsert(EventReviewVO erv);
	
}
