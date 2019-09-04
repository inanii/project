package kr.co.ziziza.manager.info;

public interface MngInfoService {

	MngMemberInfoVO selectInfoMember(MngMemberInfoVO vo);

	MngManagerInfoVO selectInfoManager(MngManagerInfoVO vo2);

	MngMemberInfoVO selectModifyMember(MngMemberInfoVO vo);

	MngManagerInfoVO selectModifyManager(MngManagerInfoVO vo2);

	int memberUpdate(MngMemberInfoVO vo);

	int managerUpdate(MngManagerInfoVO vo2);

}
