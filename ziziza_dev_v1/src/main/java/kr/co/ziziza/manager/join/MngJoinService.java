package kr.co.ziziza.manager.join;


public interface MngJoinService {

	int joinMember(MngMemberJoinVO vo);

	int joinManager(MngManagerJoinVO vo2);

	int joinIdCheck(MngMemberJoinVO vo);
	
}
