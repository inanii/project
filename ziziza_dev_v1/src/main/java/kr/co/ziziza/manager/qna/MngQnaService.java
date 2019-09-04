package kr.co.ziziza.manager.qna;

import java.util.List;
import java.util.Map;

public interface MngQnaService {

	int qnaInsert(MngQnaVO vo);

	List<MngQnaVO> selectQnaList(Map<String, Object> params);

	int qnaDelete(MngQnaVO vo);

	int selectTotalCnt(Map<String, Object> params);

}
