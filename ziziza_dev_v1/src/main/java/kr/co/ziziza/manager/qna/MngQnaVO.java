package kr.co.ziziza.manager.qna;

import org.apache.ibatis.type.Alias;

@Alias("MngQnaVO")
public class MngQnaVO {
	private int		qnaNo;
	private String	qstTitle;
	private String 	qstContents;
	private char	alarmType;
	private String	registDate;
	private char	state;
	private String	answer;
	private	String	answerDate;
	private	int		answerNo;
	private int		memberNo;
	
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
	public char getAlarmType() {
		return alarmType;
	}
	public void setAlarmType(char alarmType) {
		this.alarmType = alarmType;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
}
