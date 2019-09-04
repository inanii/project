package kr.co.ziziza.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ziziza.admin.dao.impl.AdminCommentDAOImpl;
import kr.co.ziziza.admin.service.AdminCommentService;
import kr.co.ziziza.admin.vo.AdminCommentVO;

@Service
public class AdminCommentServiceImpl implements AdminCommentService{

	@Autowired
	private AdminCommentDAOImpl dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()

	@Override
	public List<AdminCommentVO> selectList(Map<String, Object> params) {
		return dao.selectList(params);
	}//selectList()

	@Override
	public AdminCommentVO selectInfo(Map<String, Object> params) {
		return null;
	}//selectInfo()

	@Transactional
	@Override
	public int insertInfo(AdminCommentVO vo) {
		return 0;
	}//insertInfo()

	@Transactional
	@Override
	public int updateInfo(AdminCommentVO vo) {
		return 0;
	}//updateInfo()

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public int deleteInfo(Map<String, Object> params) {
		return dao.deleteInfo(params);
	}//deleteInfo()
	
}//class end