package kr.co.ziziza.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.ziziza.admin.vo.AdminBoardVO;

public interface AdminBoardService {
	
	int selectTotalCnt(Map<String, Object> params);
	
	List<AdminBoardVO> selectList(Map<String, Object> params);
	
	AdminBoardVO selectInfo(Map<String, Object> params);

	int insertInfo(AdminBoardVO vo);

	int updateInfo(AdminBoardVO vo);

	int deleteInfo(Map<String, Object> params);
	
}//interface end