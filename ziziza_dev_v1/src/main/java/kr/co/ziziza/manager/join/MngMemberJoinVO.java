package kr.co.ziziza.manager.join;

import org.apache.ibatis.type.Alias;

@Alias("MngMemberJoinVO")
public class MngMemberJoinVO {
	//MEMBER
	private	int		memberNo;			//회원고유번호
	private String 	memberId;			//회원아이디
	private String	password;			//회원비밀번호
	private String	memberName;		//회원이름
	private String  phone;				//핸드폰번호
	private String 	email;				//이메일
	private String 	joinDate;			//권한명
	private String 	lastAccessDate;	//최근접속일
	private String 	leaveDate;			//탈퇴일
	private String	leaveReason;		//탈퇴사유
	private	char	state;				//'Y'정상 'S'정지 'H'휴먼,'L'탈퇴
	private	String	roleName;			//권한명
	private	int		mngNo;			//권한명
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getLastAccessDate() {
		return lastAccessDate;
	}
	public void setLastAccessDate(String lastAccessDate) {
		this.lastAccessDate = lastAccessDate;
	}
	public String getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}
	public String getLeaveReason() {
		return leaveReason;
	}
	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
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
}
