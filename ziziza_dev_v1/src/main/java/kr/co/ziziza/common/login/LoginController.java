package kr.co.ziziza.common.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ziziza.common.util.SendEmail;
import kr.co.ziziza.common.vo.UserVO;
import kr.co.ziziza.interceptor.SessionListner;

@Controller
public class LoginController extends SessionListner{

	@Autowired
	private LoginService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private SendEmail sendEmail;
	
	/**
	 * Login Page		로그인 페이지 이동
	 * @param			
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String mainSignIn() {
		return "main/login/login";
	}//signIn()
	
	/**
	 * Login Page		로그인 페이지 이동
	 * @param			
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/{role}/login", method = RequestMethod.GET)
	public String signIn(@PathVariable String role) {
		if(role.equals("mng")) role = "manager";
		return role + "/login/login";
	}//signIn()
	
	/**
	 * Login Process		로그인 처리
	 * @param		loginId	아이디, 	loginPw	비밀번호
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/{role}/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, Object> loginProc(@PathVariable String role, UserVO loginInfo, HttpSession session) {
		Map<String, Object> params = new HashMap<String, Object>();
		if(role.equals("main")) role = "user";
		if(role.equals("mng")) role = "manager";
		UserVO loginUser = service.loginUser(loginInfo);
		boolean result = false;
		String returnURL = "/";
		String message = "로그인 오류!!!!!!";
		if(loginUser != null) {
			if(!loginUser.getRoleName().equals(role.toUpperCase())){
				message = "로그인 권한이 없습니다.";
			}else if(passwordEncoder.matches(loginInfo.getUserPw(), loginUser.getUserPw())){
//			}else if(loginInfo.getUserPw().equals(loginUser.getUserPw())){
				result = isUsing(session, loginUser.getUserId());		//다른 브라우저에서 아이디를 사용 중인가?
				if(result) {												// 기존 로그인 된 회원이면
					removeLoginInfo(session, loginUser.getUserId());        // 기존 세션 정보 삭제
					result = false;
					message = "다른 곳에서 해당 계정으로 로그인되었습니다. 로그아웃 처리 됩니다. 다시 로그인 해주세요.";
				}else {					//새로운 세션 확인 >> 생성
					service.updateAccessDate(loginUser.getUserNo());	//접속일 갱신
					loginUser.setUserPw("");
					session.setAttribute("loginUser", loginUser);
					setSession(session, loginUser.getUserId());
					result = true;
					message = "로그인 성공!!!!!!";
					if(role.equals("user"))	returnURL = "/main";
					else if(role.equals("manager")) returnURL = "/mng/main";
					else if(role.equals("admin")) returnURL = "/admin/main";
				}//if end
			}else{
				message = "비밀번호가 일치하지 않습니다.";
			}//if end
		}else {
			message = "아이디가 존재하지 않습니다.";
		}//if end
		params.put("result", result);
		params.put("returnURL", returnURL);
		params.put("message", message);
		return params;
	}//loginProc()
	
	/**
	 * LogOut Process		로그아웃 처리
	 * @param		
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/{role}/logout", method = RequestMethod.GET)
	public String logOutProc(@PathVariable String role, HttpSession session) {
		if(isLogin(session.getId())) {
			UserVO vo = (UserVO) session.getAttribute("loginUser");
			removeLoginInfo(session, vo.getUserId());
		}
		return "redirect:/" + role + "/login";
	}//logOutProc()
	
	/**
	 * 임시비밀번호 발송
	 * @param		memberNo	회원 번호
	 * @return 		View
	 * @exception
	 */
	@RequestMapping(value = "/tempPw", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> tempPassword(@RequestParam Map<String, Object> params) {
		boolean result = false;
		String message = "오류!!!!!!";
		
		UserVO user = service.selectUser(params);
		
		if(user != null) {
			result = sendEmail.sendTempPassword(user);
			user.setUserPw(passwordEncoder.encode(user.getUserPw()));
			if(result)  service.updatePassword(user);
			else message = "이메일을 보내지 못했습니다.";
			message = "임시비밀번호 이메일 발송 완료";
		}else{
			message = "회원이 존재하지 않습니다.";
		}//if end

		params.put("result", result);
		params.put("message", message);
		
		return params;
	}//logOutProc()
	
}//class end