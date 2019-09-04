package kr.co.ziziza.admin.dao;

import java.util.List;
import java.util.Map;

import kr.co.ziziza.admin.vo.AdminManagerVO;

public interface AdminManagerDAO {
	
	int selectTotalCnt(Map<String, Object> params);
	
	List<AdminManagerVO> selectList(Map<String, Object> params);

	AdminManagerVO selectInfo(Map<String, Object> params);

	int insertInfo(AdminManagerVO vo);

	int updateInfo(AdminManagerVO vo);

	int deleteInfo(Map<String, Object> params);
	
}//interface end