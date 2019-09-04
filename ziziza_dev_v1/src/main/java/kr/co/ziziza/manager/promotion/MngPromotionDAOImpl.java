package kr.co.ziziza.manager.promotion;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MngPromotionDAOImpl implements MngPromotionDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int companyInsert(MngPromotionVO vo) {
		int count = 0;
		count = sqlSession.insert("CompanyPromotionMapper.promotionInsert",vo);
		return count;
	}//companyInsert
	
	@Override
	public int companyDelete(MngPromotionVO vo) {
		int count = 0;
		count = sqlSession.delete("CompanyPromotionMapper.companyDelete",vo);
		return count;
	}
	
	@Override
	public List<MngPromotionVO> selectPromotionList(MngPromotionVO vo) {
		List<MngPromotionVO> list = null;
		list = sqlSession.selectList("CompanyPromotionMapper.selectPromotionList", vo);
		return list;
	}//selectPromotionList
	
	@Override
	public MngPromotionVO promotionDetail(MngPromotionVO vo) {
		vo = sqlSession.selectOne("CompanyPromotionMapper.promotionDetail",vo);
		return vo;
	}
}
