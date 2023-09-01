package com.ss.demo.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.EventReviewVO;
import com.ss.demo.domain.EventVO;
import com.ss.demo.domain.Event_LikeVO;
import com.ss.demo.domain.SearchVO;

@Repository
public class EventDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// 숙소 리스트 불러오기
	public List<EventVO> selectAll(SearchVO searchVO) {
		return sqlSession.selectList("com.ss.demo.persistence.EventService_Mapper.selectAll", searchVO);
	}
	
	// 숙소 등록
	public  int insert(EventVO ev) {
		return sqlSession.insert("com.ss.demo.persistence.EventService_Mapper.insert", ev);
	}

	// 등록된 숙소카운트 (rentalhome.status = 'Y')
	public int select_event_count() {
		return sqlSession.selectOne("com.ss.demo.persistence.EventService_Mapper.select_event_count");
	}
	
	// 숙소 VIEW 데이터 
	public  EventVO selectOneByevent_number(int event_number) {
		return sqlSession.selectOne("com.ss.demo.persistence.EventService_Mapper.selectOneByevent_number",event_number);
	}
	
	// 숙소  업데이트 
	public int update(EventVO ev) {
		System.out.println("event_number " + ev.getEvent_number());
		return sqlSession.update("com.ss.demo.persistence.EventService_Mapper.update", ev);
	}
	
	// 파일 업로드 
	public int insert_file(EventVO ev) {
		return sqlSession.insert("com.ss.demo.persistence.EventService_Mapper.insert_file", ev);
	}

	// 파일 불러오기 
	public List<EventVO> selectAttach(EventVO ev) {
		return sqlSession.selectList("com.ss.demo.persistence.EventService_Mapper.selectAttach", ev);
	}
	
	// 숙소 정보 삭제하기
	public int delete_event(int event_number) {
		return sqlSession.update("com.ss.demo.persistence.EventService_Mapper.delete_event", event_number);
	}
	// 객실 등록하기
	public  int insert_review(EventReviewVO erv) {
		return sqlSession.insert("com.ss.demo.persistence.EventService_Mapper.insert_review", erv);
	}
	
	// 객실 리스트 불러오기
	public List<EventReviewVO> selectAll_review(int event_number) {
		
		return sqlSession.selectList("com.ss.demo.persistence.EventService_Mapper.selectAll_review", event_number);
	}
	
	// 객실 정보 불러오기
	public EventReviewVO selectOneBycomment_number(int comment_number) {
		return sqlSession.selectOne("com.ss.demo.persistence.EventService_Mapper.selectOneBycomment_number", comment_number);
	}
	
	// 객실 정보 업데이트
	public int update_review(EventReviewVO erv) {
		return sqlSession.update("com.ss.demo.persistence.EventService_Mapper.update_review", erv);
	}
	// 객실 정보 삭제하기
	public int delete_review(int comment_number) {
		return sqlSession.update("com.ss.demo.persistence.EventService_Mapper.delete_review", comment_number);
	}

	// 숙소 이미지 리스트 불러오기
	public List<EventVO> selectAll_event_attach(int event_number) {
		return sqlSession.selectList("com.ss.demo.persistence.EventService_Mapper.selectAll_event_attach", event_number);
	}

	// 숙소  썸네일 제거 
	public int init_attach_thumbnail(int event_number) {
		return sqlSession.update("com.ss.demo.persistence.EventService_Mapper.init_attach_thumbnail", event_number);
	}
	// 숙소  썸네일 등록
	public int attach_thumbnail(int event_number) {
		return sqlSession.update("com.ss.demo.persistence.EventService_Mapper.attach_thumbnail", event_number);
	}
	
	// 객실 등록 이미지 삭제하기
	public int delete_attach(int attach_number) {
		return sqlSession.delete("com.ss.demo.persistence.EventService_Mapper.delete_attach", attach_number);
	}
	
	
	public List<EventVO> selectAll_event(EventVO ev) {
	
		return sqlSession.selectList("com.ss.demo.persistence.EventService_Mapper.selectAll_event", ev);
	}
	

	// 좋아요 등록하기
	public int insert_like(Event_LikeVO likeVO) {
		return sqlSession.insert("com.ss.demo.persistence.EventService_Mapper.insert_like", likeVO);
	}
	
	// 좋아요 개수 카운트
	public int select_like(int event_number) {
		return sqlSession.selectOne("com.ss.demo.persistence.EventService_Mapper.select_like", event_number);
	}
	
	// 좋아요 중복체크
	public int dupl_like(Event_LikeVO likeVO) {
		return sqlSession.selectOne("com.ss.demo.persistence.EventService_Mapper.dupl_like", likeVO);
	}
	
	// 좋아요 삭제
	public int delete_like(Event_LikeVO likeVO) {
		return sqlSession.delete("com.ss.demo.persistence.EventService_Mapper.delete_like", likeVO);
	}

	// 리뷰 전체 카운트 
	public int selectAllCount_eventreview(int event_number) {
		return sqlSession.selectOne("com.ss.demo.persistence.EventService_Mapper.selectAllCount_eventreview", event_number);
	}

	// 리뷰 카운트 
	public int selectCount_eventreview(EventReviewVO erv) {
		return sqlSession.selectOne("com.ss.demo.persistence.EventService_Mapper.selectCount_eventreview", erv);
	}

	public int increment_hit(int event_number) {
		return sqlSession.update("com.ss.demo.dao.EventService_Mapper.increment_hit", event_number);
	}
}