package kr.co.ziziza.manager.promotion;

import java.util.List;

public interface MngPromotionService {

	int promotionInsert(MngPromotionVO vo);

	List<MngPromotionVO> selectPromotionList(MngPromotionVO vo);

	MngPromotionVO promotionDetail(MngPromotionVO vo);

	int promotionDelete(MngPromotionVO vo);
}
