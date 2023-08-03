package com.ss.demo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.demo.dao.EventDAO;
import com.ss.demo.domain.EventReviewVO;
import com.ss.demo.domain.EventVO;
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
	
	@Override
	public int EventInsert(EventVO ev) {
		
		
		int value = esm.EventInsert(ev);
		return value;
	}

	 @Override
	 public EventVO selectOneByevent_number(int event_number) { 
		
		 return ed.selectOneByevent_number(event_number);
	  
	  }
	  
	  
	  @Override
	  public int update(EventVO ev) { 
		return ed.update(ev);
	  
	  }
	 
	  
	  @Override
	  public int insert(EventVO ev) { 
		return ed.insert(ev);
	  
	  }


	@Override
	public List<EventVO> list(SearchVO searchVO) {
		
		return ed.list(searchVO);
	}

	
	@Override
	public int EventReviewinsert(EventReviewVO erv) {
		return ed.EventReviewinsert(erv);
	}

	  
	
	
}
