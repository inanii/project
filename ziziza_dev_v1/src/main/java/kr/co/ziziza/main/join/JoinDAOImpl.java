package kr.co.ziziza.main.join;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.common.vo.UserVO;

@Repository
public class JoinDAOImpl implements JoinDAO{
	@Autowired
	SqlSession sqlSession;

	@Override
	public int joinIDCheck(MemberVO vo) {
		int cnt=0;
		cnt=sqlSession.selectOne("JoinMapper.joinIDChk", vo);
		return cnt;
	}

	@Override
	public int joinIns(MemberVO vo) {
		int successCnt=0;
		successCnt=sqlSession.insert("JoinMapper.joinIns", vo);
		return successCnt;
	}
	
	@Override
	public String findIDProc(MemberVO vo) {
		return sqlSession.selectOne("JoinMapper.findID", vo);
	}
	
	@Override
	public UserVO findPassProc(MemberVO vo) {
		return sqlSession.selectOne("JoinMapper.findPass", vo);
	}
	
	@Override
	public MemberVO selectMe(UserVO vo) {
		return sqlSession.selectOne("JoinMapper.selectMe",vo);
	}

	@Override
	public int updateInfo(MemberVO vo) {
		return sqlSession.update("JoinMapper.updateInfo", vo);
	}
	
	@Override
	public int updatePw(Map<String, Object> params) {
		return sqlSession.update("JoinMapper.updatePw", params);
	}
	
}