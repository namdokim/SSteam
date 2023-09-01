package com.ss.demo.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.FoodReviewVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.Food_LikeVO;
import com.ss.demo.domain.Food_ReportVO;
import com.ss.demo.domain.Food_Review_ReportVO;
import com.ss.demo.domain.SearchVO;

@Repository
public class FoodDAO 
{
	@Autowired
	private SqlSession sqlSession;
	//================================================================================= [1] 맛집 메인 페이지
	// [insert] 식당 -> 글 등록 
	public int insert(FoodVO vo) 
	{ return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert", vo); }
	
		// [insert_file] 식당 -> 파일 업로드 
		public int insert_file(FoodVO vo) 
		{ return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert_file_attach", vo); }
		
		// [selectAttach] 식당 -> 파일 불러오기 
		public List<FoodVO> selectAttach(FoodVO vo)
		{ return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAttach", vo); }
	
		// [selectAll_food_attach] 맛집 이미지 리스트 불러오기 
		public List<FoodVO> selectAll_food_attach(int fNo) 
		{ return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll_food_attach",fNo); }
		
	// [list] 식당 -> 리스트 불러오기, 페이징 -> 글 조회 
	public List<FoodVO> selectAll(SearchVO searchVO) 
	{ return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll",searchVO); }
		
	// [selectOneByFno] 식당 -> 고유 번호 선택 
		public FoodVO selectOneByFno(int fNo) 
		{ return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectOneByFno",fNo); }
		
	// [update] 식당 -> 글 수정 
	public int update(FoodVO vo) 
	{
		System.out.println("DAO 진입");
		return sqlSession.update("com.ss.demo.mapper.foodMapper.update", vo);
	}
	
		// [attach_thumbnail] 글 수정 -> 맛집 썸네일 등록
		public int attach_thumbnail(int food_attach_number) 
		{ return sqlSession.update("com.ss.demo.mapper.foodMapper.attach_thumbnail", food_attach_number); }
		
		// [init_attach_thumbnail] 글 수정 -> 맛집 썸네일 제거 
		public int init_attach_thumbnail(int fNo) 
		{ return sqlSession.update("com.ss.demo.mapper.foodMapper.init_attach_thumbnail", fNo); }
	
		// [delete_attach] 글 수정 -> 맛집 등록 이미지 삭제하기 
		public int delete_attach(int food_attach_number) 
		{ return sqlSession.delete("com.ss.demo.mapper.foodMapper.delete_attach",food_attach_number); }
		
	// [delete] 식당 -> 글 삭제 
	public int delete(int fNo)
	{ return sqlSession.delete("com.ss.demo.mapper.foodMapper.delete", fNo); }
	

	//================================================================================= [2] 맛집 뷰 페이지 
	// [insert Menu] 메뉴 -> 글 등록  
	public int insertMenu(FoodVO vo) 
	{
		System.out.println(vo.getfNo());
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insertMenu", vo);
	}
		// 좋아요 등록하기
		public int insert_like(Food_LikeVO likeVO) {
			return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert_like", likeVO);
		}
		// 신고내용 insert -> int=성공시 1, 실패시 0,: insert,update,delete 
		public int insert_report(Food_ReportVO food_reportVO) 
		{ return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert_report",food_reportVO); }
		
		// 리뷰 신고내용 insert -> int=성공시 1, 실패시 0,: insert,update,delete 
		public int insert_review_report(Food_Review_ReportVO food_review_reportVO) 
		{ return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert_review_report",food_review_reportVO); }
		
	// [list Menu] 메뉴 -> 리스트 불러오기 -> 글 조회 
	public List<FoodVO> selectAllMenu(int fNo) 
	{ return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAllMenu", fNo); }

		// [selectListByFno] 식당 상세 페이지 -> 상단 사진 List (5개)  
		public List<FoodVO> selectListByFno(int fNo) 
		{ return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectListByFno", fNo); }
	
		// [select_food_count] status가 Y인 것만 count -> 등록한 사진 중 썸네일 선택 
		public int select_food_count() 
		{ return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.select_food_count"); }

		// 좋아요 개수 카운트
		public int select_like(int fNo) {
			return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.select_like", fNo);
		}
		// 좋아요 중복체크
		public int dupl_like(Food_LikeVO likeVO) {
			return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.dupl_like", likeVO);
		}
		
		// 리뷰 전체 카운트 
		public int selectAllCount_foodreview(int fNo) {
			return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectAllCount_foodreview", fNo);
		}

		// 리뷰 카운트 
		public int selectCount_foodreview(FoodReviewVO foodreviewVO) {
			return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectCount_foodreview", foodreviewVO);
		}

	// -> 글 수정 	
	// 조회수 증가 
	public int increment_hit(int fNo) {
		return sqlSession.update("com.ss.demo.mapper.foodMapper.increment_hit", fNo);
	}
		
		
		
	// -> 글 삭제 
	// 좋아요 취소
	public int delete_like(Food_LikeVO likeVO) {
		return sqlSession.delete("com.ss.demo.mapper.foodMapper.delete_like", likeVO);
	}

	// 메뉴 삭제 
	public int delete_menu(int food_menu_number) {
		return sqlSession.delete("com.ss.demo.mapper.foodMapper.delete_menu", food_menu_number);
	}
	
	
	
	//================================================================================= [3] 맛집 리뷰 페이지 
	// [FoodReviewVO] 리뷰 -> 글 작성 (DB에 넣음 (모달창 리뷰내용))
	public int insert(FoodReviewVO vo) 
	{ return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert_foodreview", vo); }
	
	// [list] 리뷰 -> 글 조회 
	public List<FoodReviewVO> list(int fNo) 
	{ return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll_foodreview",fNo); }
	
		// [selectOneByFRno] 리뷰 -> 리뷰 고유 번호 선택 (Ajax) 
		public FoodReviewVO selectOneByFRno(int food_review_number) 
		{ return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectOneByFRno",food_review_number); }

		// 평점 
		public double selectAvg_foodreview(int fNo) 
		{ return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectAvg_foodreview",fNo); }
		
	// [modify_foodreview] 리뷰 -> 글 수정 
	public int modify_foodreview(FoodReviewVO foodreviewVO) 
	{ return sqlSession.update("com.ss.demo.mapper.foodMapper.modify_foodreview", foodreviewVO); }
	
	
	// [delete_foodreview] 리뷰 -> 글 삭제 
	public int delete_foodreview(int food_review_number) 
	{ return sqlSession.delete("com.ss.demo.mapper.foodMapper.delete_foodreview", food_review_number); }

	
}