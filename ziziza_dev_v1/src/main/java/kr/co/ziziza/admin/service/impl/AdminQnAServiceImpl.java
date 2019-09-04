package kr.co.ziziza.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ziziza.admin.dao.impl.AdminQnADAOImpl;
import kr.co.ziziza.admin.service.AdminQnAService;
import kr.co.ziziza.admin.vo.AdminQnAVO;

@Service
public class AdminQnAServiceImpl implements AdminQnAService{

	@Autowired
	private AdminQnADAOImpl dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()

	@Override
	public List<AdminQnAVO> selectList(Map<String, Object> params) {
		return dao.selectList(params);
	}//selectList()

	@Override
	public AdminQnAVO selectInfo(Map<String, Object> params) {
		return dao.selectInfo(params);
	}//selectInfo()

	@Transactional
	@Override
	public int insertInfo(AdminQnAVO vo) {
		return 0;
	}//insertInfo()

	@Transactional
	@Override
	public int updateInfo(AdminQnAVO vo) {
		return dao.updateInfo(vo);
	}//updateInfo()

	@Transactional
	@Override
	public int deleteInfo(Map<String, Object> params) {
		return dao.deleteInfo(params);
	}//deleteInfo()

}//class end