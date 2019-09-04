package kr.co.ziziza.manager.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MngQnaServiceImpl implements MngQnaService{
	
	@Autowired
	private MngQnaDAO dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}
	
	@Override
	public int qnaInsert(MngQnaVO vo) {
		int count = 0;
		count = dao.qnaInsert(vo);
		return count;
	}//qnaInsert
	
	@Override
	public List<MngQnaVO> selectQnaList(Map<String, Object> params) {
		List<MngQnaVO> list = null;
		list = dao.selectQnaList(params);
		return list;
	}//selectQnaList()
	
	@Override
	public int qnaDelete(MngQnaVO vo) {
		int count = 0;
		count =  dao.qnaDelete(vo);
		return count;
	}//qnaInsert
	
}
