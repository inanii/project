package kr.co.ziziza.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ziziza.admin.dao.impl.AdminCompanyDAOImpl;
import kr.co.ziziza.admin.service.AdminCompanyService;
import kr.co.ziziza.admin.vo.AdminChargeVO;
import kr.co.ziziza.admin.vo.AdminCompanyVO;
import kr.co.ziziza.admin.vo.AdminPlantsVO;

@Service
public class AdminCompanyServiceImpl implements AdminCompanyService{

	@Autowired
	private AdminCompanyDAOImpl dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()

	@Override
	public List<AdminCompanyVO> selectList(Map<String, Object> params) {
		return dao.selectList(params);
	}//selectList()

	@Override
	public AdminCompanyVO selectInfo(Map<String, Object> params) {
		return dao.selectInfo(params);
	}//selectInfo()

	@Transactional
	@Override
	public int insertInfo(AdminCompanyVO vo) {
		return 0;
	}//insertInfo()

	@Transactional
	@Override
	public int updateInfo(AdminCompanyVO vo) {
		return dao.updateInfo(vo);
	}//updateInfo()

	@Transactional
	@Override
	public int deleteInfo(Map<String, Object> params) {
		return dao.deleteInfo(params);
	}//deleteInfo()
	
	@Override
	public List<AdminChargeVO> selectChargeList(int companyNo) {
		return dao.selectChargeList(companyNo);
	}//selectChargeList()
	
	@Override
	public List<AdminPlantsVO> selectPlantsList(int companyNo) {
		return dao.selectPlantsList(companyNo);
	}//selectChargeList()

}//class end