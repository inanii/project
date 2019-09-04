package kr.co.ziziza.manager.company;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository
public class MngCompanyDAOImpl implements MngCompanyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return sqlSession.selectOne("CompanyListMngMapper.selectTotalCnt", params);
	}
	
	@Override
	public List<MngRegistVO> selectRegistList(Map<String, Object> params) {
		List<MngRegistVO> list = null;
		list = sqlSession.selectList("CompanyListMngMapper.selectCompanyList", params);
		return list;
	}//selectMemberList()
	
	@Override
	public MngRegistVO selectDetail(MngRegistVO vo) {
		vo = sqlSession.selectOne("CompanyListMngMapper.selectDetail", vo);
		return vo;
	}//selectDetail()
	
	@Override
	public List<MngRegistVO> selectDetailCharge(MngRegistVO vo) {
		return sqlSession.selectList("CompanyListMngMapper.selectDetailCharge", vo);
	}//selectDetailCharge()

	@Override
	public List<MngPlantsVO> selectDetailPlants(MngRegistVO vo) {
		return sqlSession.selectList("CompanyListMngMapper.selectDetailPlants", vo);
	}
	
	@Override
	public int companyInsert(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.insert("CompanyListMngMapper.companyInsert", vo);
		return count;
	}
	@Override
	public int companyCharge(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.insert("CompanyListMngMapper.companyCharge", vo);
		return count;
	}
	@Override
	public int companyPlant(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.insert("CompanyListMngMapper.companyPlant", vo);
		return count;
	}
	@Override
	public int deleteCompany(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.delete("CompanyListMngMapper.companyDelete", vo);
		return count;
	}//deleteCompany
	
	@Override
	public int companyUpdate(MngRegistVO vo) {
		int count = 0;
		count = sqlSession.update("CompanyListMngMapper.companyUpdate", vo);
		return count;
	}
	
	@Override
	public int chargeInsert(MngChargeVO vo) {
		return sqlSession.insert("CompanyListMngMapper.chargeInsert", vo);
	}
	
	@Override
	public int updateCharge(MngChargeVO vo) {
		return sqlSession.update("CompanyListMngMapper.chargeUpdate", vo);
	}
	
	@Override
	public int chargeDelete(MngChargeVO vo) {
		return sqlSession.delete("CompanyListMngMapper.chargeDelete", vo);
	}
	
	@Override
	public int plantInsert(MngPlantsVO vo) {
		return sqlSession.insert("CompanyListMngMapper.plantInsert", vo);
	}
	
	@Override
	public int plantUpdate(MngPlantsVO vo) {
		return sqlSession.update("CompanyListMngMapper.plantUpdate", vo);
	}
	
	@Override
	public int plantDelete(MngPlantsVO vo) {
		return sqlSession.delete("CompanyListMngMapper.plantDelete", vo);
	}
	
}