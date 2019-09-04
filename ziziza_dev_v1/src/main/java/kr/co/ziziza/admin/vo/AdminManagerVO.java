package kr.co.ziziza.admin.vo;

import org.apache.ibatis.type.Alias;

/**
 * AdminManagerVO
 * @author Park
 * @version 19-07-12
 */
@Alias("AdminManagerVO")
public class AdminManagerVO {
	private int 	mngNo;		//사업자 고유번호
	private String	mngName;	//대표자명
	private	String 	bizNo;	//사업자 번호
	private String 	repTel;		//대표 연락처
	private	String	applyDate;	//승인일
	private	char	state;		//상태
	private	int		memberNo;	//사업자 회원 고유번호
	private	int		applyNo;	//관리자 회원 고유번호
	private String	applyName;	//관리자 회원 이름
	
	public int getMngNo() {
		return mngNo;
	}
	public void setMngNo(int mngNo) {
		this.mngNo = mngNo;
	}
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	public String getBizNo() {
		return bizNo;
	}
	public void setBizNo(String bizNo) {
		this.bizNo = bizNo;
	}
	public String getRepTel() {
		return repTel;
	}
	public void setRepTel(String repTel) {
		this.repTel = repTel;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getApplyNo() {
		return applyNo;
	}
	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}
	public String getApplyName() {
		return applyName;
	}
	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}
	
}//class end