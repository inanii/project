package kr.co.ziziza.manager.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service	
public class MngInfoServiceImpl implements MngInfoService{
	@Autowired
	private MngInfoDAO dao;

	@Override
	public MngMemberInfoVO selectInfoMember(MngMemberInfoVO vo) {
		vo = dao.selectInfoMember(vo);
		return vo;
	}//selectInfoMember
	
	@Override
	public MngManagerInfoVO selectInfoManager(MngManagerInfoVO vo2) {
		vo2 = dao.selectInfoManager(vo2);
		return vo2;
	}//selectInfoManager
	
	@Override
	public MngMemberInfoVO selectModifyMember(MngMemberInfoVO vo) {
		vo = dao.selectInfoMember(vo);
		return vo;
	}//selectInfoMember
	
	@Override
	public MngManagerInfoVO selectModifyManager(MngManagerInfoVO vo2) {
		vo2 = dao.selectInfoManager(vo2);
		return vo2;
	}//selectInfoMember
	
	@Override
	public int memberUpdate(MngMemberInfoVO vo) {
		int count = 0;
		count = dao.memberUpdate(vo);
		return count;
	}
	
	@Override
	public int managerUpdate(MngManagerInfoVO vo2) {
		int count = 0;
		count = dao.managerUpdate(vo2);
		return count;
	}
	
	
}
