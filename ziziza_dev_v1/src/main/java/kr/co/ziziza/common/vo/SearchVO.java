package kr.co.ziziza.common.vo;

public class SearchVO	{
	private String searchType;	//검색 조건
	private String searchTxt;	//검색 단어
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
	
}//class end