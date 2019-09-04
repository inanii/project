package kr.co.ziziza.main.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int selectTotalCnt(Map<String, Object> params) {
		return sqlSession.selectOne("MainMapper.selectTotalCnt", params);
	}
	
	public List<BoardVO> list(Map<String, Object> params) {
		return sqlSession.selectList("MainMapper.boardList", params);
	}
	
	public int Insert(BoardVO vo) {
		int count = 0;
		count = sqlSession.insert("MainMapper.boardInsert", vo);
		return count;
	}

	public BoardVO detail(BoardVO vo) {
		vo = sqlSession.selectOne("MainMapper.boardetaild", vo);
		return vo;
	}

	public int delete(BoardVO vo) {
		int count = 0;
		count = sqlSession.delete("MainMapper.boardDelete", vo);
		System.out.println(count);
		return count;
	}

	public int update(BoardVO vo) {
		int count = 0;
		count = sqlSession.delete("MainMapper.boardupdate", vo);
		return count;
	}

	public List<ReplyVO> reply(BoardVO vo) {
		List<ReplyVO> list = null;
		list = sqlSession.selectList("MainMapper.boardreplylist", vo);
		return list;
	}

	public int insertreply(ReplyVO vo) {
		int successCnt = 0;
		successCnt = sqlSession.insert("MainMapper.insertReply",vo);
		return successCnt;
	}

	public ReplyVO replyDetail(ReplyVO vo) {
		vo = sqlSession.selectOne("MainMapper.ReplyDetail", vo);
		return vo;
	}

	public int deleteReply(ReplyVO vo) {
		return sqlSession.delete("MainMapper.deleteBoardReply",vo);
		
	}

	public List<BoardVO> topList() {
		return sqlSession.selectList("MainMapper.boardTopList");
	}

	public int updateHit(int boardNo) {
		return sqlSession.update("MainMapper.updateHit", boardNo);
	}
	

}
