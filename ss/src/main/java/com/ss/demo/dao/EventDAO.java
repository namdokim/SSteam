package com.ss.demo.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.EventReviewVO;
import com.ss.demo.domain.EventVO;
import com.ss.demo.domain.SearchVO;

@Repository
public class EventDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<EventVO> list(SearchVO searchVO) {
		
		return sqlSession.selectList("com.ss.demo.persistence.EventService_Mapper.selectAll",searchVO);
	}
	
	public  EventVO selectOneByevent_number(int event_number) {
		return sqlSession.selectOne("com.ss.demo.persistence.EventService_Mapper.selectOneByevent_number",event_number);
	}
	
	public  int update(EventVO ev) {
		return sqlSession.update("com.ss.demo.persistence.EventService_Mapper.update", ev);
	}

	
	public  int insert(EventVO ev) {
		return sqlSession.insert("com.ss.demo.persistence.EventService_Mapper.insert", ev);
	}

	public  int EventReviewinsert(EventReviewVO erv) {
		return sqlSession.insert("com.ss.demo.persistence.EventService_Mapper.EventReviewInsert", erv);
	}

	
	
	
	
}