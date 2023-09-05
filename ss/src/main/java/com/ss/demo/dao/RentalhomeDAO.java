package com.ss.demo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.Rentalhome_LikeVO;
import com.ss.demo.domain.Rentalhome_PayVO;
import com.ss.demo.domain.Rentalhome_ReviewVO;
import com.ss.demo.domain.Rentalhome_Review_ReportVO;
import com.ss.demo.domain.Rentalhome_RoomVO;
import com.ss.demo.domain.Rentalhome_SearchVO;

@Repository
public class RentalhomeDAO {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	// 숙소 등록
	public int insert(RentalhomeVO rentalhomeVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert", rentalhomeVO);
	}

	// 숙소 리스트 불러오기
	public List<RentalhomeVO> selectAll(Rentalhome_SearchVO searchVO) {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAll", searchVO);
	}

	// 등록된 숙소카운트 (rentalhome.status = 'Y')
	public int select_rentalhome_count() {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.select_rentalhome_count");
	}

	// 숙소 VIEW 데이터 
	public RentalhomeVO selectOneByIdx(int rentalhome_idx) {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.selectOneByIdx", rentalhome_idx);
	}

	// 숙소  업데이트 
	public int update(RentalhomeVO rentalhomeVO) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update", rentalhomeVO);
	}

	// 파일 업로드 
	public int insert_file(RentalhomeVO rentalhomeVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert_file", rentalhomeVO);
	}

	// 파일 불러오기 
	public List<RentalhomeVO> selectAttach(RentalhomeVO rentalhomeVO) {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAttach", rentalhomeVO);
	}
	
	// 숙소 정보 삭제하기
	public int delete_rentalhome(int rentalhome_idx) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.delete_rentalhome", rentalhome_idx);
	}
	
	// 객실 등록하기
	public int insert_room(Rentalhome_RoomVO roomVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert_room", roomVO);
	}

	// 객실 이미지 등록하기
	public int insert_room_file(Rentalhome_RoomVO roomVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert_room_file", roomVO);
	}
	
	// 객실 리스트 불러오기
	public List<Rentalhome_RoomVO> selectAll_room(Rentalhome_SearchVO searchVO) {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAll_room", searchVO);
	}

	// 객실 정보 불러오기
	public Rentalhome_RoomVO selectOneByIdx_room(int room_idx) {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.selectOneByIdx_room", room_idx);
	}
	// 객실 정보 업데이트
	public int update_room(Rentalhome_RoomVO roomVO) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update_room", roomVO);
	}
	
	// 객실 정보 삭제하기
	public int delete_room(int room_idx) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.delete_room", room_idx);
	}

	// 숙소 이미지 리스트 불러오기
	public List<RentalhomeVO> selectAll_rentalhome_attach(int rentalhome_idx) {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAll_rentalhome_attach", rentalhome_idx);
	}
	
	// 숙소  썸네일 제거 
	public int init_attach_thumbnail(int rentalhome_idx) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.init_attach_thumbnail", rentalhome_idx);
	}

	// 숙소  썸네일 등록
	public int attach_thumbnail(int attach_idx) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.attach_thumbnail", attach_idx);
	}

	// 객실 등록 이미지 불러오기
	public List<Rentalhome_RoomVO> selectAll_room_attach() {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAll_room_attach");
	}

	// 객실 등록 이미지 삭제하기
	public int delete_attach(int attach_idx) {
		return sqlSession.delete("com.ss.demo.dao.RentalhomeService_Mapper.delete_attach", attach_idx);
	}
	
	// 리뷰 등록하기
	public int insert_review(Rentalhome_ReviewVO reviewVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert_review", reviewVO);
	}

	// 좋아요 등록하기
	public int insert_like(Rentalhome_LikeVO likeVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert_like", likeVO);
	}
	
	// 좋아요 개수 카운트
	public int select_like(int rentalhome_idx) {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.select_like", rentalhome_idx);
	}
	
	// 좋아요 중복체크
	public int dupl_like(Rentalhome_LikeVO likeVO) {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.dupl_like", likeVO);
	}

	// 좋아요 취소
	public int delete_like(Rentalhome_LikeVO likeVO) {
		return sqlSession.delete("com.ss.demo.dao.RentalhomeService_Mapper.delete_like", likeVO);
	}
	
	// 객실  썸네일 제거 
	public int init_attach_room_thumbnail(int room_idx) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.init_attach_room_thumbnail", room_idx);
	}

	// 객실  썸네일 등록
	public int room_attach_thumbnail(int attach_idx) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.room_attach_thumbnail", attach_idx);
	}

	// 객실 등록 이미지 삭제
	public int room_attach_delete(int attach_idx) {
		return sqlSession.delete("com.ss.demo.dao.RentalhomeService_Mapper.room_attach_delete", attach_idx);
	}
	
	// 객실 이미지 불러오기
	public List<Rentalhome_RoomVO> selectAll_room_attach_ByIdx(int room_idx) {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAll_room_attach_ByIdx", room_idx);
	}
	
	// 리뷰 등록하기
	public int insert_pay(Rentalhome_PayVO rentalhome_payVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert_pay", rentalhome_payVO);
	}

	// 예약번호로 예약 조회하기
	public Rentalhome_PayVO selectOneByReserve_number(String reserve_number) {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.selectOneByReserve_number", reserve_number);
	}

	// 예약 리스트 조회하기
	public List<Rentalhome_PayVO> selectAll_reserve(int uNo) {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAll_reserve", uNo);
	}

	// 환불
	public int update_pay_refund(Rentalhome_PayVO rentalhome_payVO) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update_pay_refund", rentalhome_payVO);
	}

	// 리뷰 등록시 리뷰등록여부 업데이트
	public int update_pay_reviewYN(String reserve_number) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update_pay_reviewYN", reserve_number);
	}

	// 리뷰 갯수 카운트
	public int select_review_count(int rentalhome_idx) {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.select_review_count", rentalhome_idx);
	}

	// 리뷰 4개 기준 평점 
	public Rentalhome_ReviewVO select_review_avg(int rentalhome_idx) {
		return sqlSession.selectOne("com.ss.demo.dao.RentalhomeService_Mapper.select_review_avg", rentalhome_idx);
	}

	// 리뷰 리스트 불러오기
	public List<Rentalhome_ReviewVO> selectAll_review(int rentalhome_idx) {
		return sqlSession.selectList("com.ss.demo.dao.RentalhomeService_Mapper.selectAll_review", rentalhome_idx);
	}

	// 리뷰 삭제
	public int delete_review(int review_idx) {
		return sqlSession.delete("com.ss.demo.dao.RentalhomeService_Mapper.delete_review", review_idx);
	}

	// 리뷰 수정
	public int update_review(Rentalhome_ReviewVO reviewVO) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update_review", reviewVO);
	}
	
	// 신고 등록
	public int insert_review_report(Rentalhome_Review_ReportVO reportVO) {
		return sqlSession.insert("com.ss.demo.dao.RentalhomeService_Mapper.insert_review_report", reportVO);
	}

	// 객실 삭제시 리뷰 상태 비활성 업데이트
	public int update_review_status(int room_idx) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update_review_status", room_idx);
	}

	// 결제시 유저 포인트 감소
	public int update_point_minus(Rentalhome_PayVO payVO) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update_point_minus", payVO);
	}
	// 결제시 유저 포인트 증가
	public int update_point_plus(Rentalhome_PayVO payVO) {
		return sqlSession.update("com.ss.demo.dao.RentalhomeService_Mapper.update_point_plus", payVO);
	}
}
