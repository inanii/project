package kr.co.ziziza.manager.promotion;

import java.util.List;

public interface MngPromotionDAO {

	public int companyInsert(MngPromotionVO vo);

	public List<MngPromotionVO> selectPromotionList(MngPromotionVO vo);

	public MngPromotionVO promotionDetail(MngPromotionVO vo);

	public int companyDelete(MngPromotionVO vo);
}
