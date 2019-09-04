package kr.co.ziziza.admin.vo;

import org.apache.ibatis.type.Alias;

/**
 * AdminCompanyVO
 * @author Park
 * @version 19-07-18
 */
@Alias("AdminChargeVO")
public class AdminChargeVO {
	private int		companyNo;
	private String	timeKind;
	private	String	subject;
	private int		price;
	private String	etcContent;
	
	public int getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}
	public String getTimeKind() {
		return timeKind;
	}
	public void setTimeKind(String timeKind) {
		this.timeKind = timeKind;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getEtcContent() {
		return etcContent;
	}
	public void setEtcContent(String etcContent) {
		this.etcContent = etcContent;
	}
	
	
}//class end