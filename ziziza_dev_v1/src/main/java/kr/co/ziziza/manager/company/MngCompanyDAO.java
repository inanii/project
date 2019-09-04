package kr.co.ziziza.manager.company;

import java.util.List;
import java.util.Map;

public interface MngCompanyDAO {

	public int companyInsert(MngRegistVO vo);

	public int companyCharge(MngRegistVO vo);

	public int companyPlant(MngRegistVO vo);

	public List<MngRegistVO> selectRegistList(Map<String, Object> params);
	
	public MngRegistVO selectDetail(MngRegistVO vo);

	public List<MngRegistVO> selectDetailCharge(MngRegistVO vo);

	public List<MngPlantsVO> selectDetailPlants(MngRegistVO vo);

	public int deleteCompany(MngRegistVO vo);

	public int companyUpdate(MngRegistVO vo);

	public int selectTotalCnt(Map<String, Object> params);

	public int updateCharge(MngChargeVO vo);

	public int chargeDelete(MngChargeVO vo);

	public int chargeInsert(MngChargeVO vo);

	public int plantDelete(MngPlantsVO vo);

	public int plantInsert(MngPlantsVO vo);

	public int plantUpdate(MngPlantsVO vo);

}
