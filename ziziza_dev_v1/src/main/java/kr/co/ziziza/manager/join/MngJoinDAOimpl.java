package kr.co.ziziza.manager.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MngJoinDAOimpl implements MngJoinDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int joinMember(MngMemberJoinVO vo) {
		System.out.println("dao - joinMember");
		int count = 0;
		count = sqlSession.insert("JoinMngMapper.joinMember", vo);
		System.out.println("dao - count : "+count);
		return count;
	}
	
	@Override
	public int joinManager(MngManagerJoinVO vo2) {
		System.out.println("dao - joinManager");
		int count = 0;
		count = sqlSession.insert("JoinMngMapper.joinManager", vo2);
		System.out.println("dao - count : "+count);
		return count;
	}
	
	@Override
	public int joinIdCheck(MngMemberJoinVO vo) {
		int count = 0;
		count = sqlSession.selectOne("JoinMngMapper.joinIdCheck", vo);
		return count;
	}
}
