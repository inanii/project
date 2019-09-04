package kr.co.ziziza.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ziziza.admin.dao.impl.AdminManagerDAOImpl;
import kr.co.ziziza.admin.service.AdminManagerService;
import kr.co.ziziza.admin.vo.AdminManagerVO;

@Service
public class AdminManagerServiceImpl implements AdminManagerService{

	@Autowired
	private AdminManagerDAOImpl dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()

	@Override
	public List<AdminManagerVO> selectList(Map<String, Object> params) {
		return dao.selectList(params);
	}//selectList()

	@Override
	public AdminManagerVO selectInfo(Map<String, Object> params) {
		return dao.selectInfo(params);
	}//selectInfo()
	
	@Transactional
	@Override
	public int insertInfo(AdminManagerVO vo) {
		return 0;
	}//insertInfo()
	
	@Transactional
	@Override
	public int updateInfo(AdminManagerVO vo) {
		return dao.updateInfo(vo);
	}//updateInfo()

	@Transactional
	@Override
	public int deleteInfo(Map<String, Object> params) {
		return dao.deleteInfo(params);
	}//deleteInfo()

}//class end