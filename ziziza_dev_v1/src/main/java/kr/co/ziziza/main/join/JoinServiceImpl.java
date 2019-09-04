package kr.co.ziziza.main.join;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ziziza.common.vo.UserVO;
@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinDAO joinDAO;
	@Override
	public int joinIDCheck(MemberVO vo) {
		int cnt=0;
		cnt=joinDAO.joinIDCheck(vo);
		return cnt;
	}
	@Transactional(value = "transactionManager"
			, propagation = Propagation.REQUIRED
			, rollbackFor = Exception.class)

	@Override
	public int joinIns(MemberVO vo) {
		int successCnt=0;
		successCnt=joinDAO.joinIns(vo);
		return successCnt;
	}
	
	@Override
	public String findIDProc(MemberVO vo) {
		return joinDAO.findIDProc(vo);
	}
		
	@Override
	public UserVO findPassProc(MemberVO vo) {
		return joinDAO.findPassProc(vo);
	}
	
	@Override
	public MemberVO selectMe(UserVO vo) {
		return joinDAO.selectMe(vo);
	}
	
	@Override
	public int updateInfo(MemberVO vo) {
		return joinDAO.updateInfo(vo);
	}
	
	@Override
	public int updatePw(Map<String, Object> params) {
		return joinDAO.updatePw(params);
	}

}
