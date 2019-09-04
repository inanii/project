package kr.co.ziziza.admin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.admin.dao.AdminQnADAO;
import kr.co.ziziza.admin.vo.AdminQnAVO;

@Repository
public class AdminQnADAOImpl implements AdminQnADAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return session.selectOne("AdminQnAMapper.selectTotalCnt", params);
	}//selectTotalCnt()

	@Override
	public List<AdminQnAVO> selectList(Map<String, Object> params) {
		return session.selectList("AdminQnAMapper.selectList", params);
	}//selectList()

	@Override
	public AdminQnAVO selectInfo(Map<String, Object> params) {
		return session.selectOne("AdminQnAMapper.selectInfo", params);
	}//selectInfo()

	@Override
	public int insertInfo(AdminQnAVO vo) {
		return 0;
	}//insertInfo()

	@Override
	public int updateInfo(AdminQnAVO vo) {
		return session.update("AdminQnAMapper.updateInfo", vo);
	}//updateInfo()

	@Override
	public int deleteInfo(Map<String, Object> params) {
		return session.delete("AdminQnAMapper.deleteInfo", params);
	}//deleteInfo()

}//class end