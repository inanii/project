package kr.co.ziziza.manager.login;

import java.io.PrintWriter;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.manager.join.MngMemberJoinVO;

@Controller
public class MngLoginController {
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MngLoginController.class);
	
	@RequestMapping(value="/mng/company/findidform" ,method=RequestMethod.GET)
	public String findidform() {
		logger.info("findidform");
		return "manager/login/findId_form";
	}//findidform
	
	@RequestMapping(value="/mng/company/findidphone" ,method=RequestMethod.POST)
	public void findidphone(MngMemberJoinVO vo, PrintWriter out) {
		logger.info("findidphone");
		vo = sqlSession.selectOne("LoginMngMapper.findphone", vo);
		String successMsg ="";
		if(vo != null && vo.getMemberId() != null && !vo.getMemberId().equals("")) {
			successMsg = vo.getMemberId();
		}	
		out.print(successMsg);
		out.close();
	}//findidphone
	
	@RequestMapping(value="/mng/company/findidemail" ,method=RequestMethod.POST)
	public void findidemail(MngMemberJoinVO vo, PrintWriter out) {
		logger.info("findidemail");
		vo = sqlSession.selectOne("LoginMngMapper.findemail", vo);
		String successMsg ="";
		if(vo != null && vo.getMemberId() != null && !vo.getMemberId().equals("")) {
			successMsg = vo.getMemberId();
		}	
		out.print(successMsg);
		out.close();
	}//findidemail
	
	@RequestMapping(value="/mng/company/findpwdform" ,method=RequestMethod.GET)
	public String findpwdform() {
		logger.info("findpwdform");
		return "manager/login/findPwd_form";
	}//findpwdform
	
	@RequestMapping(value="/mng/company/findpwdphone" ,method=RequestMethod.POST)
	public void findpwdphone(MngMemberJoinVO vo, PrintWriter out) {
		logger.info("findpwdphone");
		vo = sqlSession.selectOne("LoginMngMapper.findpwdphone", vo);
		String successMsg ="";
		if(vo != null && vo.getPassword() != null && !vo.getPassword().equals("")) {
			successMsg = vo.getPassword();
		}	
		out.print(successMsg);
		out.close();
	}//findpwdphone
	
	@RequestMapping(value="/mng/company/findpwdemail" ,method=RequestMethod.POST)
	public void findpwdemail(MngMemberJoinVO vo, PrintWriter out) {
		logger.info("findpwdemail");
		vo = sqlSession.selectOne("LoginMngMapper.findpwdemail", vo);
		String successMsg ="";
		if(vo != null && vo.getPassword() != null && !vo.getPassword().equals("")) {
			successMsg = vo.getPassword();
		}	
		out.print(successMsg);
		out.close();
	}//findpwdemail
}
