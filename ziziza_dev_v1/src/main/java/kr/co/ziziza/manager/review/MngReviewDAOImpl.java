package kr.co.ziziza.manager.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.main.company.ReviewVO;


@Repository
public class MngReviewDAOImpl implements MngReviewDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return sqlSession.selectOne("QnaReviewMapper.selectTotalCnt", params);
	}
	
	@Override
	public List<ReviewVO> selectReviewList(Map<String, Object> params) {
		List<ReviewVO> list = null;
		list = sqlSession.selectList("QnaReviewMapper.selectReviewList", params);
		return list;
	}
}
