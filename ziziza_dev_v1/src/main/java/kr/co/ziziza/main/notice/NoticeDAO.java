package kr.co.ziziza.main.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.main.board.BoardVO;


@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int selectTotalCnt(Map<String, Object> params) {
		return sqlSession.selectOne("NoticeMapper.selectTotalCnt", params);
	}
	
	public List<BoardVO> list(Map<String, Object> params) {
		return sqlSession.selectList("NoticeMapper.noticeList", params);
	}

	public BoardVO detail(BoardVO vo) {
		vo = sqlSession.selectOne("NoticeMapper.noticedetail", vo);
		return vo;
	}

	public List<BoardVO> topList() {
		return sqlSession.selectList("NoticeMapper.noticeTopList");
	}
	
	public int updateHit(int boardNo) {
		return sqlSession.update("NoticeMapper.updateHit", boardNo);
	}

}
