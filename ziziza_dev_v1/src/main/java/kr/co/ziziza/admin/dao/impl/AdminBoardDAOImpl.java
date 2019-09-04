package kr.co.ziziza.admin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.admin.dao.AdminBoardDAO;
import kr.co.ziziza.admin.vo.AdminBoardVO;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return session.selectOne("AdminBoardMapper.selectTotalCnt", params);
	}//selectTotalCnt()

	@Override
	public List<AdminBoardVO> selectList(Map<String, Object> params) {
		return session.selectList("AdminBoardMapper.selectList", params);
	}//selectList()

	@Override
	public AdminBoardVO selectInfo(Map<String, Object> params) {
		return session.selectOne("AdminBoardMapper.selectInfo", params);
	}//selectInfo()

	@Override
	public int insertInfo(AdminBoardVO vo) {
		return session.insert("AdminBoardMapper.insertInfo", vo);
	}//insertInfo()

	@Override
	public int updateInfo(AdminBoardVO vo) {
		return session.update("AdminBoardMapper.updateInfo", vo);
	}//updateInfo()

	@Override
	public int deleteInfo(Map<String, Object> params) {
		return session.delete("AdminBoardMapper.deleteInfo", params);
	}//deleteInfo()

}//class end