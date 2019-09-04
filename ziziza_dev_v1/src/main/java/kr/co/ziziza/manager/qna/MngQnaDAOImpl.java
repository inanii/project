package kr.co.ziziza.manager.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MngQnaDAOImpl implements MngQnaDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return sqlSession.selectOne("QnaMngMapper.selectTotalCnt", params);
	}
	
	@Override
	public int qnaInsert(MngQnaVO vo) {
		System.out.println("dao - qnaInsert");
		int count = 0;
		count = sqlSession.insert("QnaMngMapper.QnaInsert", vo);
		return count;
	}
	
	@Override
	public List<MngQnaVO> selectQnaList(Map<String, Object> params) {
		List<MngQnaVO> list = null;
		list = sqlSession.selectList("QnaMngMapper.selectQnaList", params);
		return list;
	}//selectMemberList()
	
	@Override
	public int qnaDelete(MngQnaVO vo) {
		int count = 0;
		count = sqlSession.delete("QnaMngMapper.qnaDelete",vo);
		return count;
	}//qnaDelete()
	
}
