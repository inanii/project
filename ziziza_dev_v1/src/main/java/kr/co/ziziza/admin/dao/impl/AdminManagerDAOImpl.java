package kr.co.ziziza.admin.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.admin.dao.AdminManagerDAO;
import kr.co.ziziza.admin.vo.AdminManagerVO;

@Repository
public class AdminManagerDAOImpl implements AdminManagerDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public int selectTotalCnt(Map<String, Object> params) {
		return session.selectOne("AdminManagerMapper.selectTotalCnt", params);
	}//selectTotalCnt()

	@Override
	public List<AdminManagerVO> selectList(Map<String, Object> params) {
		return session.selectList("AdminManagerMapper.selectList", params);
	}//selectList()

	@Override
	public AdminManagerVO selectInfo(Map<String, Object> params) {
		return session.selectOne("AdminManagerMapper.selectInfo", params);
	}//selectInfo()

	@Override
	public int insertInfo(AdminManagerVO vo) {
		return 0;
	}//insertInfo()

	@Override
	public int updateInfo(AdminManagerVO vo) {
		return session.insert("AdminManagerMapper.updateInfo", vo);
	}//updateInfo()

	@Override
	public int deleteInfo(Map<String, Object> params) {
		return session.delete("AdminManagerMapper.deleteInfo", params);
	}//deleteInfo()

}//class end