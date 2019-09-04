package kr.co.ziziza.manager.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;





/**
 * MemberService Interface
 * @author Park
 * @version 19-07-09
 */

@Service
public class MngCompanyListServiceImpl implements MngCompanyListService{
	
	@Autowired
	private MngCompanyDAO dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}
	
	@Override
	public List<MngRegistVO> selectRegistList(Map<String, Object> params) {
		List<MngRegistVO> list = null;
		list = dao.selectRegistList(params);
		return list;
	}//selectCompanyList()

	@Override
	public MngRegistVO selectDetail(MngRegistVO vo) {
		vo = dao.selectDetail(vo);
		return vo;
	}//selectDetail()
	
	@Override
	public List<MngRegistVO> selectDetailCharge(MngRegistVO vo) {
		return dao.selectDetailCharge(vo);
	}//selectDetailCharge()
	
	@Override
	public List<MngPlantsVO> selectDetailPlants(MngRegistVO vo) {
		return dao.selectDetailPlants(vo);
	}
	
	@Override
	public int companyInsert(MngRegistVO vo) {
		int count = 0;
		count = dao.companyInsert(vo);
		return count;
	}//companyInsert
	
	@Override
	public int companyCharge(MngRegistVO vo) {
		int count = 0;
		count = dao.companyCharge(vo);
		return count;
	}//companyCharge
	
	@Override
	public int companyPlant(MngRegistVO vo) {
		int count = 0;
		count = dao.companyPlant(vo);
		return count;
	}//companyPlant
	
	@Override
	public int deleteCompany(MngRegistVO vo) {
		int count = 0;
		count = dao.deleteCompany(vo);
		return count;
	}//deleteCompany
	
	
	@Override
	public int companyUpdate(MngRegistVO vo) {
		int count = 0;
		count = dao.companyUpdate(vo);
		return count;
	}//companyUpdate
	
	@Override
	public int chargeInsert(MngChargeVO vo) {
		return dao.chargeInsert(vo);
	}
	
	@Override
	public int updateCharge(MngChargeVO vo) {
		return dao.updateCharge(vo);
	}
	
	@Override
	public int chargeDelete(MngChargeVO vo) {
		return dao.chargeDelete(vo);
	}

	@Override
	public int plantDelete(MngPlantsVO vo) {
		return dao.plantDelete(vo);
	}
	
	@Override
	public int plantInsert(MngPlantsVO vo) {
		return dao.plantInsert(vo);
	}
	
	@Override
	public int plantUpdate(MngPlantsVO vo) {
		return dao.plantUpdate(vo);
	}
	
}//class end