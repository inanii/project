package kr.co.ziziza.manager.join;

public interface MngJoinDAO {

	public int joinMember(MngMemberJoinVO vo);

	public int joinManager(MngManagerJoinVO vo2);

	public int joinIdCheck(MngMemberJoinVO vo);

}
