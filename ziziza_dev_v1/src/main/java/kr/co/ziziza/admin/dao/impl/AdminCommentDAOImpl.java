package kr.co.ziziza.admin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.admin.dao.AdminCommentDAO;
import kr.co.ziziza.admin.vo.AdminCommentVO;

@Repository
public class AdminCommentDAOImpl implements AdminCommentDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return session.selectOne("AdminCommentMapper.selectTotalCnt", params);
	}//selectTotalCnt()

	@Override
	public List<AdminCommentVO> selectList(Map<String, Object> params) {
		return session.selectList("AdminCommentMapper.selectList", params);
	}//selectList()

	@Override
	public AdminCommentVO selectInfo(Map<String, Object> params) {
		return null;
	}//selectInfo()

	@Override
	public int insertInfo(AdminCommentVO vo) {
		return 0;
	}//insertInfo()

	@Override
	public int updateInfo(AdminCommentVO vo) {
		return 0;
	}//updateInfo()

	@Override
	public int deleteInfo(Map<String, Object> params) {
		return session.delete("AdminCommentMapper.deleteInfo", params);
	}//deleteInfo()

}//class end