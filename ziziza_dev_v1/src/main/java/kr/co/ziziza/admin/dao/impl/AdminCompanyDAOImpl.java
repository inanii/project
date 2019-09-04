package kr.co.ziziza.admin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.admin.dao.AdminCompanyDAO;
import kr.co.ziziza.admin.vo.AdminChargeVO;
import kr.co.ziziza.admin.vo.AdminCompanyVO;
import kr.co.ziziza.admin.vo.AdminPlantsVO;

@Repository
public class AdminCompanyDAOImpl implements AdminCompanyDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return session.selectOne("AdminCompanyMapper.selectTotalCnt", params);
	}//selectTotalCnt()

	@Override
	public List<AdminCompanyVO> selectList(Map<String, Object> params) {
		return session.selectList("AdminCompanyMapper.selectList", params);
	}//selectList()

	@Override
	public AdminCompanyVO selectInfo(Map<String, Object> params) {
		return session.selectOne("AdminCompanyMapper.selectInfo", params);
	}//selectInfo()

	@Override
	public int insertInfo(AdminCompanyVO vo) {
		return 0;
	}//insertInfo()

	@Override
	public int updateInfo(AdminCompanyVO vo) {
		return session.update("AdminCompanyMapper.updateInfo", vo);
	}//updateInfo()

	@Override
	public int deleteInfo(Map<String, Object> params) {
		return session.delete("AdminCompanyMapper.deleteInfo", params);
	}//deleteInfo()
	
	@Override
	public List<AdminChargeVO> selectChargeList(int companyNo) {
		return session.selectList("AdminCompanyMapper.selectChargeList", companyNo);
	}//selectChargeList()
	
	@Override
	public List<AdminPlantsVO> selectPlantsList(int companyNo) {
		return session.selectList("AdminCompanyMapper.selectPlantsList", companyNo);
	}//selectPlantsList()

}//class end