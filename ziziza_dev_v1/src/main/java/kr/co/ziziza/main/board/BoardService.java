package kr.co.ziziza.main.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService {

	@Autowired
	BoardDAO dao;
	
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()
	
	public List<BoardVO> list(Map<String, Object> params) {
		return dao.list(params);
	}
	
	public List<BoardVO> topList() {
		return dao.topList();
	}

	public int insert(BoardVO vo) {
		return dao.Insert(vo);
	}

	public BoardVO detail(BoardVO vo) {
		return dao.detail(vo);
	}

	public int boarddelete(BoardVO vo) {
		return dao.delete(vo);
	}

	public int boardupdate(BoardVO vo) {
		return dao.update(vo);
	}
	
	public int insertBoardReply(ReplyVO vo) {
		return dao.insertreply(vo);
	}
	

	public List<ReplyVO> boardReplyList(BoardVO vo) {
		return dao.reply(vo);
	}

	public ReplyVO boardReplyDetail(ReplyVO vo) {
		return dao.replyDetail(vo);
	}

	public int deleteReply(ReplyVO vo) {
		return dao.deleteReply(vo);
		
	}

	public int updateHit(int boardNo) {
		return dao.updateHit(boardNo);
	}

}
