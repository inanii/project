package kr.co.ziziza.manager.info;

public interface MngInfoDAO {

	MngMemberInfoVO selectInfoMember(MngMemberInfoVO vo);

	MngManagerInfoVO selectInfoManager(MngManagerInfoVO vo2);

	int memberUpdate(MngMemberInfoVO vo);

	int managerUpdate(MngManagerInfoVO vo2);

}
