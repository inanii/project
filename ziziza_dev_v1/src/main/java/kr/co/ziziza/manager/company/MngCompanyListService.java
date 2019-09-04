package kr.co.ziziza.manager.company;

import java.util.List;
import java.util.Map;

public interface MngCompanyListService {
	List<MngRegistVO> selectRegistList(Map<String, Object> params);

	int companyInsert(MngRegistVO vo);

	int companyCharge(MngRegistVO vo);

	int companyPlant(MngRegistVO vo);

	MngRegistVO selectDetail(MngRegistVO vo);

	List<MngRegistVO> selectDetailCharge(MngRegistVO vo);

	List<MngPlantsVO> selectDetailPlants(MngRegistVO vo);

	int deleteCompany(MngRegistVO vo);

	int companyUpdate(MngRegistVO vo);

	int selectTotalCnt(Map<String, Object> params);

	int updateCharge(MngChargeVO vo);

	int chargeDelete(MngChargeVO vo);

	int chargeInsert(MngChargeVO vo);

	int plantInsert(MngPlantsVO vo);

	int plantUpdate(MngPlantsVO vo);

	int plantDelete(MngPlantsVO vo);

}
