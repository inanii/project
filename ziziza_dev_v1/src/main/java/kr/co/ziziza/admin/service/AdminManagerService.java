package kr.co.ziziza.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.ziziza.admin.vo.AdminManagerVO;

public interface AdminManagerService {
	
	int selectTotalCnt(Map<String, Object> params);
	
	List<AdminManagerVO> selectList(Map<String, Object> params);
	
	AdminManagerVO selectInfo(Map<String, Object> params);

	int insertInfo(AdminManagerVO vo);

	int updateInfo(AdminManagerVO vo);

	int deleteInfo(Map<String, Object> params);
	
}//interface end