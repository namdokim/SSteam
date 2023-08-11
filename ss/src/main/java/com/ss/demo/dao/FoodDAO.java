package com.ss.demo.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.FoodReviewVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.SearchVO;

@Repository
public class FoodDAO {
	
	
	//============================ @Autowired sqlSession
	@Autowired
	private SqlSession sqlSession;
	//============================
	
	
	// 식당 등록 
	public int insert(FoodVO vo) {
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert", vo);
	}
	
	// 식당 리스트 불러오기 (list) - 페이징 
	public List<FoodVO> list(SearchVO searchVO) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll",searchVO);
	}
	
	// selectOneByFno 
	public FoodVO selectOneByFno(int fNo) {
		return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectOneByFno",fNo);
	}
	
	
	// 메뉴 등록 (insert Menu) 
	public int insertMenu(FoodVO vo) {
		System.out.println(vo.getfNo());
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insertMenu", vo);
	}
	
	// 메뉴 리스트 불러오기 (list Menu)
	public List<FoodVO> listMenu(int fNo) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAllMenu", fNo);
	}

	// 파일 업로드 
	public int insert_file(FoodVO vo) {
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert_file_attach", vo);
	}
	
	// 파일 불러오기 
	public List<FoodVO> selectAttach(FoodVO vo) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAttach", vo);
	}

	// 식당 업데이트
	public int update(FoodVO vo) {
		System.out.println("DAO 진입");
		return sqlSession.update("com.ss.demo.mapper.foodMapper.update", vo);
	}

	public int delete(int fNo) {
		return sqlSession.delete("com.ss.demo.mapper.foodMapper.delete", fNo);
	}
	
	// ================ 상세페이지 사진5개 List 
	public List<FoodVO> selectListByFno(int fNo) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectListByFno", fNo);
	}

	// 맛집 리스트 불러오기 (페이징) 
//	public List<FoodVO> selectAll(Criteria cri) {
//		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll", cri);
//	}

	public int select_food_count() {
		return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.select_food_count");
	}

	//======================================= 첨부파일 수정  
	// 맛집 썸네일 제거 
	public int init_attach_thumbnail(int fNo) {
		return sqlSession.update("com.ss.demo.mapper.foodMapper.init_attach_thumbnail", fNo);
	}

	// 맛집 썸네일 등록
	public int attach_thumbnail(int food_attach_number) {
		return sqlSession.update("com.ss.demo.mapper.foodMapper.attach_thumbnail", food_attach_number);
	}

	//======================================= 맛집 등록 이미지 삭제하기 
	public int delete_attach(int food_attach_number) {
		return sqlSession.delete("com.ss.demo.mapper.foodMapper.delete_attach",food_attach_number);
	}

	// 맛집 이미지 리스트 불러오기 
	public List<FoodVO> selectAll_food_attach(int fNo) {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll_food_attach",fNo);
	}
	
	//===============================================================================================
	//db에 넣음 (모달창 리뷰내용) 
	public int insert(FoodReviewVO vo) {
		return sqlSession.insert("com.ss.demo.mapper.foodMapper.insert_foodreview", vo);
	}
	
	public List<FoodReviewVO> list() {
		return sqlSession.selectList("com.ss.demo.mapper.foodMapper.selectAll_foodreview");
	}
	
	//=========================== ajax 리뷰 
	public FoodReviewVO selectOneByFRno(int food_review_number) {
		return sqlSession.selectOne("com.ss.demo.mapper.foodMapper.selectOneByFRno",food_review_number);
	}

	public int delete_foodreview(int food_review_number) {
		return sqlSession.delete("com.ss.demo.mapper.foodMapper.delete_foodreview", food_review_number);
	}

	public int modify_foodreview(FoodReviewVO foodreviewVO) {
		return sqlSession.update("com.ss.demo.mapper.foodMapper.modify_foodreview", foodreviewVO);
	}
	
	
	
	
	
	
	
	
	
	
}