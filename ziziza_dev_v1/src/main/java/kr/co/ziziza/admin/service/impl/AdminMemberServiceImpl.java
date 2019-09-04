package kr.co.ziziza.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ziziza.admin.dao.impl.AdminMemberDAOImpl;
import kr.co.ziziza.admin.service.AdminMemberService;
import kr.co.ziziza.admin.vo.AdminMemberVO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private AdminMemberDAOImpl dao;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return dao.selectTotalCnt(params);
	}//selectTotalCnt()

	@Override
	public List<AdminMemberVO> selectList(Map<String, Object> params) {
		return dao.selectList(params);
	}//selectList()

	@Override
	public AdminMemberVO selectInfo(Map<String, Object> params) {
		return dao.selectInfo(params);
	}//selectInfo()

	@Transactional
	@Override
	public int insertInfo(AdminMemberVO vo) {
		return dao.insertInfo(vo);
	}//insertInfo()

	@Transactional
	@Override
	public int updateInfo(AdminMemberVO vo) {
		return dao.updateInfo(vo);
	}//updateInfo()

	@Transactional
	@Override
	public int deleteInfo(Map<String, Object> params) {
		return dao.deleteInfo(params);
	}//deleteInfo()

	@Override
	public int checkId(Map<String, Object> params) {
		return dao.checkId(params);
	}//checkId()
	
}//class end