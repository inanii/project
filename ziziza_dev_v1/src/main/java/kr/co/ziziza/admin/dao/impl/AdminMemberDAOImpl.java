package kr.co.ziziza.admin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.admin.dao.AdminMembaerDAO;
import kr.co.ziziza.admin.vo.AdminMemberVO;

@Repository
public class AdminMemberDAOImpl implements AdminMembaerDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return session.selectOne("AdminMemberMapper.selectTotalCnt", params);
	}//selectTotalCnt()

	@Override
	public List<AdminMemberVO> selectList(Map<String, Object> params) {
		return session.selectList("AdminMemberMapper.selectList", params);
	}//selectList()

	@Override
	public AdminMemberVO selectInfo(Map<String, Object> params) {
		return session.selectOne("AdminMemberMapper.selectInfo", params);
	}//selectInfo()

	@Override
	public int insertInfo(AdminMemberVO vo) {
		return session.insert("AdminMemberMapper.insertInfo", vo);
	}//insertInfo()

	@Override
	public int updateInfo(AdminMemberVO vo) {
		return session.update("AdminMemberMapper.updateInfo", vo);
	}//updateInfo()

	@Override
	public int deleteInfo(Map<String, Object> params) {
		return session.delete("AdminMemberMapper.deleteInfo", params);
	}//deleteInfo()
	
	@Override
	public int checkId(Map<String, Object> params) {
		return session.selectOne("AdminMemberMapper.checkId", params);
	}//checkId()

}//class end