package kr.co.ziziza.manager.info;

import org.apache.ibatis.type.Alias;

@Alias("MngManagerInfoVO")
public class MngManagerInfoVO {
	//MANAGER
	private	int		mngNo;		//사업자고유번호
	private String	mngName;	//사업자명
	private String 	bizNo;	//사업자등록번호
	private String	repTel;	//사업자대표번호
	private	char	state;		//('W'대기 'R'검토 'Y'승인)
	private String	applyDate;	//승인일
	private	int		memberNo;	//회원고유번호
	private	int		applyNo;	//승인번호
	
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
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
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
}
