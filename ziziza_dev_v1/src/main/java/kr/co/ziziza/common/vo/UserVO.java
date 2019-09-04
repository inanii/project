package kr.co.ziziza.common.vo;

import org.apache.ibatis.type.Alias;

@Alias("UserVO")
public class UserVO {
	private int		userNo;		//로그인 회원번호
	private String 	userId;		//로그인 아이디
	private String 	userPw;		//로그인 비밀번호
	private String 	userName;	//로그인 이름
	private String 	roleName;	//로그인 권한
	private int 	mngNo;		//사업자번호
	private String 	email;		//이메일
	private String 	phone;		//휴대전화
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public int getMngNo() {
		return mngNo;
	}
	public void setMngNo(int mngNo) {
		this.mngNo = mngNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}//class end