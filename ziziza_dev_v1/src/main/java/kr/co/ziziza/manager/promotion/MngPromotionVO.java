package kr.co.ziziza.manager.promotion;

import org.apache.ibatis.type.Alias;

@Alias("MngPromotionVO")
public class MngPromotionVO {
	private int		cEventNo;
	private int		companyNo;
	private String	eventContent;
	private String	registDate;
	
	public int getcEventNo() {
		return cEventNo;
	}
	public void setcEventNo(int cEventNo) {
		this.cEventNo = cEventNo;
	}
	public int getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
}
