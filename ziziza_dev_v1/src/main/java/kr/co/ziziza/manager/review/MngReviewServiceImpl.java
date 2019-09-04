package kr.co.ziziza.manager.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziziza.main.company.ReviewVO;

@Service
public class MngReviewServiceImpl implements MngReviewService {
	
	@Autowired
	private MngReviewDAO dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt
	
	@Override
	public List<ReviewVO> selectReviewList(Map<String, Object> params) {
		List<ReviewVO> list = null;
		list = dao.selectReviewList(params);
		return list;
	}//selectReviewList
}
