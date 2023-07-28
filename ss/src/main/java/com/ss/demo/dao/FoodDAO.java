package com.ss.demo.dao;
import java.util.List;





import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.demo.domain.FoodVO;

@Repository
public class FoodDAO {
	
	@Autowired
	private SqlSession sqlSession;

//	public List<FoodVO> list(SearchVO searchVO) {
//		
//		return sqlSession.selectList("edu.springStudy.mapper.foodMapper.selectAll",searchVO);
//	}
	
//	public FoodVO selectOneByBidx(int bidx) {
//		return sqlSession.selectOne("edu.springStudy.mapper.boardMapper.selectOneByBidx",bidx);
//	}
//	
//	public int update(FoodVO vo) {
//		return sqlSession.update("edu.springStudy.mapper.boardMapper.update", vo);
//	}
//	
//	public int delete(int bidx) {
//		return sqlSession.delete("edu.springStudy.mapper.boardMapper.delete", bidx);
//	}
//	
//	public int insert(FoodVO vo) {
//		return sqlSession.insert("edu.springStudy.mapper.boardMapper.insert", vo);
//	}
//	
//	
	
}
