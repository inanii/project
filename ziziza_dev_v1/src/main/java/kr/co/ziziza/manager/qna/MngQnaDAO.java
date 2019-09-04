package kr.co.ziziza.manager.qna;

import java.util.List;
import java.util.Map;

public interface MngQnaDAO {

	public int qnaInsert(MngQnaVO vo);

	public List<MngQnaVO> selectQnaList(Map<String, Object> params);

	public int qnaDelete(MngQnaVO vo);

	public int selectTotalCnt(Map<String, Object> params);


}
