package kr.co.ziziza.common.vo;

import org.apache.ibatis.type.Alias;

/**
 * FileVO
 * @author Park
 * @version 19-07-15
 */
@Alias("FileVO")
public class FileVO {
	private int 	fileNo;			//고유번호
	private String	menuType;		//메뉴 종류	사업자/공지/이벤트/커뮤니티
	private int		menuNo;			//파일 게시물 번호
	private String	fileType;		//파일 구분 첨부파일/배너/슬라이드이미지
	private	String 	originName;		//원래 파일명
	private	String	saveName;		//저장 이름
	private	String	savePath;		//저장 경로
	private	String	thumName;		//썸네일 이름
	private	String	thumPath;		//썸네일 경로
	private	String	fileStorage;	//파일크기
	private String 	fileContentType;		//확장자
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getThumName() {
		return thumName;
	}
	public void setThumName(String thumName) {
		this.thumName = thumName;
	}
	public String getThumPath() {
		return thumPath;
	}
	public void setThumPath(String thumPath) {
		this.thumPath = thumPath;
	}
	public String getFileStorage() {
		return fileStorage;
	}
	public void setFileStorage(String fileStorage) {
		this.fileStorage = fileStorage;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	@Override
	public String toString() {
		return "FileVO [fileNo=" + fileNo + ", menuType=" + menuType + ", menuNo=" + menuNo + ", fileType=" + fileType
				+ ", originName=" + originName + ", saveName=" + saveName + ", savePath=" + savePath + ", thumName="
				+ thumName + ", thumPath=" + thumPath + ", fileStorage=" + fileStorage + ", fileContentType=" + fileContentType + "]";
	}
	
}//class end