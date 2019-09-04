package kr.co.ziziza.main.join;

import java.util.Map;

import kr.co.ziziza.common.vo.UserVO;

public interface JoinService {

	public int joinIDCheck(MemberVO vo); 
	
	public int joinIns(MemberVO vo);

	public String findIDProc(MemberVO vo);

	public UserVO findPassProc(MemberVO vo);

	public MemberVO selectMe(UserVO vo);

	public int updateInfo(MemberVO vo);

	public int updatePw(Map<String, Object> params); 
	

}
