package kr.co.ziziza.main.company;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.main.board.ReplyVO;
import kr.co.ziziza.manager.company.MngChargeVO;
import kr.co.ziziza.manager.company.MngPlantsVO;
import kr.co.ziziza.manager.company.MngRegistVO;
import kr.co.ziziza.manager.promotion.MngPromotionVO;

@Repository
public class CompanyDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<MngRegistVO> list() {
		List<MngRegistVO> list = null;
		list = sqlSession.selectList("CompanyMapper.companylist");
		return list;
	}

	public MngRegistVO detail(MngRegistVO vo) {
		vo = sqlSession.selectOne("CompanyMapper.companydetail", vo);
		return vo;
	}

	public List<ReplyVO> companyreply(MngRegistVO vo) {
		List<ReplyVO> list = null;
		list = sqlSession.selectList("CompanyMapper.companyreplylist", vo);
		return list;
	}

	public int insertreply(ReviewVO vo) {
		int successCnt = 0;
		successCnt = sqlSession.insert("CompanyMapper.companyinsertReply",vo);
		return successCnt;
	}

	public ReviewVO replyDetail(ReviewVO vo) {
		vo = sqlSession.selectOne("CompanyMapper.companyReplyDetail", vo);
		return vo;
	}
	
	public int deleteReply(ReviewVO vo) {
		return sqlSession.delete("CompanyMapper.companyReplyDelete", vo);
	}

	public List<MngRegistVO> getList(Map<String, Object> params) {
		return sqlSession.selectList("CompanyMapper.companyGetList", params);
	}
	
	public List<MngPlantsVO> plantList(MngRegistVO vo) {
		return sqlSession.selectList("CompanyMapper.plantList", vo);
	}
	
	public List<MngChargeVO> chargeList(MngRegistVO vo) {
		return sqlSession.selectList("CompanyMapper.chargeList", vo);
	}
	public List<MngPromotionVO> proList(MngRegistVO vo) {
		return sqlSession.selectList("CompanyMapper.proList", vo);
	}

}
