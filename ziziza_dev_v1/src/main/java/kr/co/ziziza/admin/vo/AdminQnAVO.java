package kr.co.ziziza.admin.vo;

import org.apache.ibatis.type.Alias;

/**
 * AdminQnAVO
 * @author Park
 * @version 19-07-09
 */
@Alias("AdminQnAVO")
public class AdminQnAVO {
	private int 	qnaNo;			//문의 고유번호
	private String 	qstTitle;		//문의제목
	private String	qstContents;	//문의 내용
	private char	alramType;		//답변 알림 'E'이메일, 'P'연락처
	private String	registDate;		//등록일
	private char	state;			//상태	'Y'답변 'N'미답변
	private String	answer;			//답변 내용
	private String	answerDate;		//답변일
	private	int		answerNo;		//답변자 고유번호
	private String	answerName;		//답변자 이름
	private int		memberNo;		//문의자 고유번호
	private String	memberName;		//문의자 이름
	private String	roleName;		//문의자 구분
	private String	alramEmail;		//알람 이메일
	private String	alramPhone;		//알람 연락처
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQstTitle() {
		return qstTitle;
	}
	public void setQstTitle(String qstTitle) {
		this.qstTitle = qstTitle;
	}
	public String getQstContents() {
		return qstContents;
	}
	public void setQstContents(String qstContents) {
		this.qstContents = qstContents;
	}
	public char getAlramType() {
		return alramType;
	}
	public void setAlramType(char alramType) {
		this.alramType = alramType;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public char getState() {
		return state;
	}
	public void setState(char state) {
		this.state = state;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public String getAnswerName() {
		return answerName;
	}
	public void setAnswerName(String answerName) {
		this.answerName = answerName;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getAlramEmail() {
		return alramEmail;
	}
	public void setAlramEmail(String alramEmail) {
		this.alramEmail = alramEmail;
	}
	public String getAlramPhone() {
		return alramPhone;
	}
	public void setAlramPhone(String alramPhone) {
		this.alramPhone = alramPhone;
	}
	
	@Override
	public String toString() {
		return "AdminQnAVO [qnaNo=" + qnaNo + ", qstTitle=" + qstTitle + ", qstContents=" + qstContents + ", alramType="
				+ alramType + ", registDate=" + registDate + ", state=" + state + ", answer=" + answer + ", answerDate="
				+ answerDate + ", answerNo=" + answerNo + ", answerName=" + answerName + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + "]";
	}
	
}//class end