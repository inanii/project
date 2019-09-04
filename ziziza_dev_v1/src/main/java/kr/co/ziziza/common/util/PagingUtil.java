package kr.co.ziziza.common.util;

/**
 * Pagination	페이징 처리
 * @author Park
 * @version 19-07-10
 */
public class PagingUtil {
	private int pageSize;		//페이지 게시물 수
	private int totalItems;		//총 게시물 수
	private int totalPages;		//총 페이지 수
	private int currentPage;	//현재 페이지
	private int pageBlock;		//보여질 페이지 수
	private int pageBlockRange;	//현재 페이지 양 옆 범위
	private int startPage;		//시작 페이지
	private int endPage;		//마지막 페이지
	private int startIndex; 	//조회 시작 번호
	private int endIndex;		//조회 마지막 번호
	private boolean prevState;	//이전 페이지 활성화
	private boolean nextState;	//다음 페이지 활성화
	
	public PagingUtil() {		//초기화
		this.pageSize = 10;
		this.totalItems = 0;
		this.totalPages = 1;
		this.currentPage = 1;
		this.pageBlock = 5;
		this.pageBlockRange = 2;
		this.startPage = 1;
		this.endPage = 1;
		this.startIndex = 1;
		this.endIndex = 1;
		this.prevState = false;
		this.nextState = false;
	}//Constructor

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems == 0 ? 1 : totalItems;
		this.totalPages = (int) Math.ceil(this.totalItems / (double) this.pageSize);
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getPageBlockRange() {
		return pageBlockRange;
	}
	public void setPageBlockRange(int pageBlockRange) {
		this.pageBlockRange = pageBlockRange;
	}
	public int getStartPage() {
		if (totalPages <= pageBlock) {	//페이지 블럭 수 보다 작을때
            startPage = 1;
        } else {
            if (currentPage <= pageBlockRange + 1)					//현재 페이지 양 옆 범위 이하 일때 최대는 보여질 페이지 수
            	startPage = 1;
            else if (currentPage + pageBlockRange >= totalPages) 	//범위을 넘으면 최대는 총 페이지 수
            	startPage = totalPages - (pageBlock - 1); 
            else 													//현재 페이지 양 쪽 보여질 범위	
            	startPage = currentPage - pageBlockRange;	
        }//if
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		if (totalPages <= pageBlock) {	//페이지 블럭 수 보다 작을때
            endPage = totalPages;
        } else {
            if (currentPage <= (pageBlockRange + 1))					//현재 페이지 양 옆 범위 이하 일때 최대는 보여질 페이지 수
                endPage = pageBlock;
            else if (currentPage + pageBlockRange >= totalPages)		//범위을 넘으면 최대는 총 페이지 수
                endPage = totalPages;
            else 															//현재 페이지 양 쪽 보여질 범위
                endPage = currentPage + pageBlockRange;
        }//if
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartIndex() {
		startIndex = (currentPage - 1) * pageSize;
		return startIndex + 1;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		endIndex = Math.min(startIndex + pageSize - 1, totalItems - 1);
		return endIndex + 1;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public boolean isPrevState() {
		if(currentPage > 1) prevState = true;
		return prevState;
	}
	public void setPrevState(boolean prevState) {
		this.prevState = prevState;
	}
	public boolean isNextState() {
		if(currentPage < endPage && endPage > 1 ) nextState = true;
		return nextState;
	}
	public void setNextState(boolean nextState) {
		this.nextState = nextState;
	}

	@Override
	public String toString() {
		return "PagingUtil [pageSize=" + pageSize + ", totalItems=" + totalItems + ", totalPages=" + totalPages
				+ ", currentPage=" + currentPage + ", pageBlock=" + pageBlock + ", pageBlockRange=" + pageBlockRange
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", startIndex=" + startIndex + ", endIndex="
				+ endIndex + ", prevState=" + prevState + ", nextState=" + nextState + "]";
	}
	
}// class end