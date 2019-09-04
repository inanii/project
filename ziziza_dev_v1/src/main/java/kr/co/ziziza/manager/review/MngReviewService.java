package kr.co.ziziza.manager.review;

import java.util.List;
import java.util.Map;

import kr.co.ziziza.main.company.ReviewVO;

public interface MngReviewService {

	int selectTotalCnt(Map<String, Object> params);

	List<ReviewVO> selectReviewList(Map<String, Object> params);

}
