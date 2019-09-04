package kr.co.ziziza.main.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziziza.main.board.BoardVO;


@Service
public class NoticeService {

	@Autowired
	NoticeDAO dao;
	
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()
	
	public List<BoardVO> list(Map<String, Object> params) {
		List<BoardVO> list =  dao.list(params);
		return list;
	}

	public BoardVO detail(BoardVO vo) {
		vo = dao.detail(vo);
		return vo;
	}

	public List<BoardVO> topList() {
		return dao.topList();
	}
	
	public int updateHit(int boardNo) {
		return dao.updateHit(boardNo);
	}
	
}
