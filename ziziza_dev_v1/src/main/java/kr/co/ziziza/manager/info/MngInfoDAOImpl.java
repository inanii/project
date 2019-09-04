package kr.co.ziziza.manager.info;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MngInfoDAOImpl implements MngInfoDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public MngMemberInfoVO selectInfoMember(MngMemberInfoVO vo) {
		vo = sqlSession.selectOne("InfoMngMapper.selectInfoMember", vo);
		return vo;
	}//selectInfoMember()
	
	public MngManagerInfoVO selectInfoManager(MngManagerInfoVO vo2) {
		vo2 = sqlSession.selectOne("InfoMngMapper.selectInfoManager", vo2);
		return vo2;
	}//selectInfoMember()
	
	public int memberUpdate(MngMemberInfoVO vo) {
		int count = 0;
		count = sqlSession.update("InfoMngMapper.memberUpdate", vo);
		return count;
	}//memberUpdate()
	
	public int managerUpdate(MngManagerInfoVO vo2) {
		int count = 0;
		count = sqlSession.update("InfoMngMapper.managerUpdate", vo2);
		return count;
	}//memberUpdate()
	
}
