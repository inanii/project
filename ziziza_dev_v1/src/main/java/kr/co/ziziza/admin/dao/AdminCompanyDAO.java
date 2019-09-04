package kr.co.ziziza.admin.dao;

import java.util.List;
import java.util.Map;

import kr.co.ziziza.admin.vo.AdminChargeVO;
import kr.co.ziziza.admin.vo.AdminCompanyVO;
import kr.co.ziziza.admin.vo.AdminPlantsVO;

public interface AdminCompanyDAO {
	
	int selectTotalCnt(Map<String, Object> params);
	
	List<AdminCompanyVO> selectList(Map<String, Object> params);

	AdminCompanyVO selectInfo(Map<String, Object> params);

	int insertInfo(AdminCompanyVO vo);

	int updateInfo(AdminCompanyVO vo);

	int deleteInfo(Map<String, Object> params);
	
	List<AdminChargeVO> selectChargeList(int companyNo);
	
	List<AdminPlantsVO> selectPlantsList(int companyNo);
	
}//interface end