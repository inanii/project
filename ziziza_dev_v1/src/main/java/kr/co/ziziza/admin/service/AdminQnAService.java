package kr.co.ziziza.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.ziziza.admin.vo.AdminQnAVO;

public interface AdminQnAService {
	
	int selectTotalCnt(Map<String, Object> params);
	
	List<AdminQnAVO> selectList(Map<String, Object> params);
	
	AdminQnAVO selectInfo(Map<String, Object> params);

	int insertInfo(AdminQnAVO vo);

	int updateInfo(AdminQnAVO vo);

	int deleteInfo(Map<String, Object> params);
	
}//interface end