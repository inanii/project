package kr.co.ziziza.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ziziza.admin.dao.impl.AdminBoardDAOImpl;
import kr.co.ziziza.admin.service.AdminBoardService;
import kr.co.ziziza.admin.vo.AdminBoardVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{

	@Autowired
	private AdminBoardDAOImpl dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()

	@Override
	public List<AdminBoardVO> selectList(Map<String, Object> params) {
		return dao.selectList(params);
	}//selectList()

	@Override
	public AdminBoardVO selectInfo(Map<String, Object> params) {
		return dao.selectInfo(params);
	}//selectInfo()
	
	@Override
	@Transactional
	public int insertInfo(AdminBoardVO vo) {
		return dao.insertInfo(vo);
	}//insertInfo()

	@Override
	@Transactional
	public int updateInfo(AdminBoardVO vo) {
		return dao.updateInfo(vo);
	}//updateInfo()

	@Override
	@Transactional
	public int deleteInfo(Map<String, Object> params) {
		return dao.deleteInfo(params);
	}//deleteInfo()

}//class end