package kr.co.ziziza.main.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziziza.main.board.BoardVO;

@Service
public class EventService {

	@Autowired
	EventDAO dao;
	
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()
	
	public List<BoardVO> list(Map<String, Object> params) {
		return dao.list(params);
	}

	public BoardVO detail(BoardVO vo) {
		return dao.detail(vo);
	}

	public List<BoardVO> topList() {
		return dao.topList();
	}
	
	public int updateHit(int boardNo) {
		return dao.updateHit(boardNo);
	}

}
