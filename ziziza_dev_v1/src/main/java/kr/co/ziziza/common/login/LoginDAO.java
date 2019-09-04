package kr.co.ziziza.common.login;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ziziza.common.vo.UserVO;


@Repository
public class LoginDAO {

	@Autowired
	private SqlSession session;
	
	public UserVO selectUser(Map<String, Object> params) {
		return session.selectOne("LoginMapper.selectUser", params);
	}//selectUser()

	public UserVO loginUser(UserVO loginInfo) {
		return session.selectOne("LoginMapper.loginUser", loginInfo);
	}//selectUser()

	public int updateAccessDate(int userNo) {
		return session.update("LoginMapper.updateAccessDate", userNo);
	}
	
	public int updatePassword(UserVO user) {
		return session.update("LoginMapper.updatePassword", user);
	}

}//class end