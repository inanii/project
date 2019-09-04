package kr.co.ziziza.common.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziziza.common.vo.UserVO;


@Service
public class LoginService {

	@Autowired
	private LoginDAO dao;
	
	public UserVO selectUser(Map<String, Object> params) {
		return dao.selectUser(params);
	}//selectUser()
	
	public UserVO loginUser(UserVO loginInfo) {
		return dao.loginUser(loginInfo);
	}//loginUser()

	public int updateAccessDate(int userNo) {
		return dao.updateAccessDate(userNo);
	}//selectUser()
	
	public int updatePassword(UserVO user) {
		return dao.updatePassword(user);
	}//updatePassword()
	
}//class end