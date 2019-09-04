package kr.co.ziziza.interceptor;

import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.ziziza.common.vo.UserVO;

public class AuthRoleInterceptor extends HandlerInterceptorAdapter{

	@Resource(name="loginSessionListner")
    private SessionListner sessionListner;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
	     // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		String url = request.getRequestURI();
		String loginUrl = "/login";
		
		if ( loginUser == null ){
			// 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
			if(url.indexOf("admin") > 0) loginUrl = "/admin/login";
			else if(url.indexOf("mng") > 0) loginUrl = "/mng/login";
			
			response.sendRedirect(loginUrl);
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}else {	//수정중......
			//권한 체크 페이지 접근 로그인 페이지로
			String role = loginUser.getRoleName();
			boolean check = true;
			if(url.indexOf("admin") > 0 && !role.equals("ADMIN")) {
				check = false;
				loginUrl = "/admin/login";
			}
			if(url.indexOf("mng") > 0 && !role.equals("MANAGER")) {
				check = false;
				loginUrl = "/mng/login";
			}
			if(!check) {
				response.sendRedirect(loginUrl);
				return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
			}
		}
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}//class end