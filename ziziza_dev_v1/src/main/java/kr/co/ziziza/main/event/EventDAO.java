package kr.co.ziziza.main.event;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.main.board.BoardVO;

@Repository
public class EventDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int selectTotalCnt(Map<String, Object> params) {
		return sqlSession.selectOne("EventMapper.selectTotalCnt", params);
	}
	
	public List<BoardVO> list(Map<String, Object> params) {
		return sqlSession.selectList("EventMapper.eventList", params);
	}

	public BoardVO detail(BoardVO vo) {
		return sqlSession.selectOne("EventMapper.eventdetail", vo);
	}

	public List<BoardVO> topList() {
		return sqlSession.selectList("EventMapper.eventTopList");
	}
	
	public int updateHit(int boardNo) {
		return sqlSession.update("EventMapper.updateHit", boardNo);
	}

}
