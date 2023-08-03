package com.ss.demo.service;

import java.util.List;

import com.ss.demo.domain.EventReviewVO;
import com.ss.demo.domain.EventVO;
import com.ss.demo.domain.SearchVO;



public interface EventService {
	
	List<EventVO> list(SearchVO searchVO);
	public EventVO selectOneByevent_number(int event_number);
	public int EventInsert(EventVO ev);
	public int update(EventVO ev);
	public int insert(EventVO ev);
	
	public int EventReviewinsert(EventReviewVO erv);
}
