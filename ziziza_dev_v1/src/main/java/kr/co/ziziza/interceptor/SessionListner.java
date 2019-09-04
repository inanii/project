package kr.co.ziziza.interceptor;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.stereotype.Component;

@Component("loginSessionListner")
public class SessionListner implements HttpSessionBindingListener{

	/** 로그인 유저 관련 해쉬 테이블 **/
    public static Hashtable<String, Map<String, Object>> userList = new Hashtable<String, Map<String, Object>>();
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		userList.remove(event.getSession().getId());
	}

	/**
     * 해당 아이디가 로그인 되어있는지
     * @param sessionID
     * @return
     */
    public boolean isLogin(String sessionID){
    	boolean isLogin = false;
    	Enumeration<String> e = userList.keys();
    	String key = "";
    	while(e.hasMoreElements()){
    		key = e.nextElement();
			if(key.equals(sessionID)){
				isLogin = true;
			}
    	}
    	return isLogin;
    }

    /**
     * 해당 아이디가 사용중인지
     * @param userID
     * @return
     */
    public boolean isUsing(HttpSession session, String userID){
    	boolean isUsing = false;
    	Enumeration<String> e = userList.keys();
    	String key = "";
    	String loginId = "";
    	while(e.hasMoreElements()){
    		key = (String)e.nextElement();
    		loginId = (String) userList.get(key).get(key);
    		if(!key.equals(session.getId()) && userID.equals(loginId)){
    			isUsing = true;         
    		}
    	}
    	return isUsing;
    }
    
    /**
     * 세션 생성 , user 저장
     * @param session
     * @param userID
     */
    public void setSession(HttpSession session, String userID){
    	Map<String, Object> userSession = new HashMap<String, Object>();
    	userSession.put(session.getId() , userID);
    	userSession.put("session", session);
        userList.put(session.getId(), userSession);
    }
    
    /**
     * 중복 로그인시 이전 로그인 세션 날리기
     * @param session
     */
    public void removeLoginInfo(HttpSession session, String userID){
    	Enumeration<String> e = userList.keys();
    	String key = "";
    	String loginId = "";
    	HttpSession duplSession = null;
    	while(e.hasMoreElements()){
    		key = (String)e.nextElement();
    		loginId = (String) userList.get(key).get(key);
    		duplSession = (HttpSession) userList.get(key).get("session");
    		if(userID.equals(loginId)){
    			userList.remove(key);
    			duplSession.removeAttribute("loginUser");
    		}
    	}
    }        
	
}//class end