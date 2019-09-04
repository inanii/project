package kr.co.ziziza.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.ziziza.admin.vo.AdminMemberVO;

public interface AdminMemberService {
	
	int selectTotalCnt(Map<String, Object> params);
	
	List<AdminMemberVO> selectList(Map<String, Object> params);
	
	AdminMemberVO selectInfo(Map<String, Object> params);

	int insertInfo(AdminMemberVO vo);

	int updateInfo(AdminMemberVO vo);

	int deleteInfo(Map<String, Object> params);

	int checkId(Map<String, Object> params);
	
}//interface end