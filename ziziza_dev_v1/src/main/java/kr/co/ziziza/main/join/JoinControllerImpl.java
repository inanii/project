package kr.co.ziziza.main.join;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ziziza.common.login.LoginService;
import kr.co.ziziza.common.util.SendEmail;
import kr.co.ziziza.common.vo.UserVO;
@Controller
public class JoinControllerImpl implements JoinController{

	private static final Logger logger=LoggerFactory.getLogger(JoinControllerImpl.class);
	
	@Autowired
	JoinService joinService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private SendEmail sendEmail;
	
	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String joinForm() {
		logger.info("==joinform==");
		return "main/join/join";
	}
	@RequestMapping(value = "/joinidchk", method = RequestMethod.POST)
	public void joinIDCheck(MemberVO vo, PrintWriter out)
	throws IOException {
		logger.info("==joinIDCheck==");
		logger.info("==vo==");
		int cnt=0;
		cnt=joinService.joinIDCheck(vo);
		out.print(cnt);
		out.flush();
		out.close();
	}
	@RequestMapping(value = "/joinins", method = RequestMethod.POST)
	public void joinIns(MemberVO vo, PrintWriter out) {
		logger.info("==joinIns==");
		int successCnt=0;
		vo.setPassword(passwordEncoder.encode(vo.getPassword())); 
		successCnt=joinService.joinIns(vo);
		out.print(successCnt);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String findID() {
		return "main/join/find";
	}
	
	@RequestMapping(value = "/findidproc", method = RequestMethod.POST)
	public void findIDProc(MemberVO vo, PrintWriter out) {
		String cnt=null;
		cnt = joinService.findIDProc(vo);
		out.print(cnt);
		out.flush();
		out.close();
	}//findIDProc
	
	@RequestMapping(value = "/findpassproc", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findPassProc(MemberVO vo) {
		boolean result = false;
		String message = "오류!!!!!!";
		UserVO user = joinService.findPassProc(vo);
		Map<String, Object> params = new HashMap<String, Object>();
		if(user != null) {
			result = sendEmail.sendTempPassword(user);
			user.setUserPw(passwordEncoder.encode(user.getUserPw()));
			if(result)  loginService.updatePassword(user);
			else message = "이메일을 보내지 못했습니다.";
			message = "임시비밀번호 이메일 발송 완료";
		}else{
			message = "회원이 존재하지 않습니다.";
		}//if end
		
		params.put("result", result);
		params.put("message", message);
		
		return params;
	}//findPassProc
	
	@RequestMapping(value = "/mypage",method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session, MemberVO vo, String usrSesn) {
		logger.info("==my==");
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		vo = joinService.selectMe(loginUser);
		model.addAttribute("detailVO", vo);
		return "main/join/my";
	}
	
	@RequestMapping(value = "/updateInfo",method = RequestMethod.GET)
	public void updateInfo(Model model, HttpSession session, MemberVO vo, PrintWriter out) {
		int success = 0;
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		vo.setMemberNo(loginUser.getUserNo());
		success = joinService.updateInfo(vo);
		out.print(success);
		out.flush();
		out.close();
	}//joinIns
	
	@RequestMapping(value = "/updatePw",method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updatePw(Model model, HttpSession session, @RequestParam Map<String, Object> params) {
		boolean result = false;
		String message = "오류!!!!!!";
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		MemberVO vo = joinService.selectMe(loginUser);
		
		if(passwordEncoder.matches((String)params.get("old_password"), vo.getPassword())) {
			params.put("password", passwordEncoder.encode((String) params.get("password")));
			params.put("memberNo", vo.getMemberNo());
			int success = joinService.updatePw(params);
			result = true;
			message = "비밀번호 변경완료";
		}else {
			message = "현재 비밀번호가 일치하지 않습니다.";
		}
		params.remove("password");
		params.put("result", result);
		params.put("message", message);
		
		return params;
	}//joinIns
	
}//