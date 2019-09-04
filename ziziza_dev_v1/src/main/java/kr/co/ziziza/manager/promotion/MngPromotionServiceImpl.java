package kr.co.ziziza.manager.promotion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MngPromotionServiceImpl implements MngPromotionService{
	
	@Autowired
	private MngPromotionDAO dao;
	
	@Override
	public int promotionInsert(MngPromotionVO vo) {
		int count = 0;
		count = dao.companyInsert(vo);
		return count;
	}
	
	@Override
	public int promotionDelete(MngPromotionVO vo) {
		int count = 0;
		count = dao.companyDelete(vo);
		return count;
	}
	
	@Override
	public List<MngPromotionVO> selectPromotionList(MngPromotionVO vo) {
		List<MngPromotionVO> list = null;
		list = dao.selectPromotionList(vo);
		return list;
	}
	
	public MngPromotionVO promotionDetail(MngPromotionVO vo) {
		vo = dao.promotionDetail(vo);
		return vo;
	}
}
