package kr.co.ziziza.main.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziziza.main.board.ReplyVO;
import kr.co.ziziza.manager.company.MngChargeVO;
import kr.co.ziziza.manager.company.MngPlantsVO;
import kr.co.ziziza.manager.company.MngRegistVO;
import kr.co.ziziza.manager.promotion.MngPromotionVO;

@Service
public class CompanyService {

	@Autowired
	CompanyDAO dao;
	
	public List<MngRegistVO> list() {
		List<MngRegistVO> list = null;
		list = dao.list();
		return list;
	}

	public MngRegistVO detail(MngRegistVO vo) {
		vo = dao.detail(vo);
		return vo;
	}

	public List<ReplyVO> companyReplyList(MngRegistVO vo) {
		List<ReplyVO> list = null;
		list = dao.companyreply(vo);
		return list;
	}

	public int insertcompanyReply(ReviewVO vo) {
		int successCnt = 0;
		successCnt = dao.insertreply(vo);
		return successCnt;
	}

	public ReviewVO companyReplyDetail(ReviewVO vo) {
		vo = dao.replyDetail(vo);
		return vo;
	}
	
	public int deleteReply(ReviewVO vo) {
		return dao.deleteReply(vo);
	}

	public List<MngRegistVO> getList(Map<String, Object> params) {
		return dao.getList(params);
	}
	
	public List<MngPlantsVO> plantList(MngRegistVO vo) {
		return dao.plantList(vo);
	}
	
	public List<MngChargeVO> chargeList(MngRegistVO vo) {
		return dao.chargeList(vo);
	}
	
	public List<MngPromotionVO> proList(MngRegistVO vo) {
		return dao.proList(vo);
	}
}
