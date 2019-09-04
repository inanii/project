package kr.co.ziziza.admin.vo;

import org.apache.ibatis.type.Alias;

/**
 * AdminBoardVO
 * @author Park
 * @version 19-07-12
 */
@Alias("AdminBoardVO")
public class AdminBoardVO {
	private int 	boardNo;		//게시물 고유번호
	private String 	boardCode;		//게시물 구분 'NOTICE', 'EVENT', 'COMMUNITY'
	private String 	title;			//제목
	private String 	contents;		//내용
	private String 	eStartDate;		//이벤트 시작일
	private String 	eEndDate;		//이벤트 시작일
	private String 	registDate;		//등록일
	private String 	modifyDate;		//등록일
	private int 	hit;			//조회수
	private char	state;			//상태 'Y' 게시중  'N'숨김
	private int		memberNo;		//등록자 고유번호
	private String	memberName;		//등록자 이름
	private String	modifyNo;		//등록자 이름
	private String	modifyName;		//등록자 이름
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardCode() {
		return  boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode.toUpperCase();
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String geteStartDate() {
		return eStartDate;
	}
	public void seteStartDate(String eStartDate) {
		this.eStartDate = eStartDate;
	}
	public String geteEndDate() {
		return eEndDate;
	}
	public void seteEndDate(String eEndDate) {
		this.eEndDate = eEndDate;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getModifyNo() {
		return modifyNo;
	}
	public void setModifyNo(String modifyNo) {
		this.modifyNo = modifyNo;
	}
	public String getModifyName() {
		return modifyName;
	}
	public void setModifyName(String modifyName) {
		this.modifyName = modifyName;
	}
	
}//class end