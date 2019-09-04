package kr.co.ziziza.admin.vo;

public class AdminSearchVO	{
	private String searchType;	//검색 조건
	private String searchTxt;	//검색 단어
	private String roleName;	//구분 조건
	private char state;			//상태 조건
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchTxt() {
		return searchTxt;
	}
	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
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
	
}//class end