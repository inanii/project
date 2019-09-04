package kr.co.ziziza.manager.company;

import org.apache.ibatis.type.Alias;

@Alias("MngChargeVO")
public class MngChargeVO {
	private	int		chargeNo;		//
	private	int		companyNo;		//사업장고유번호
	private String 	timeKind;		//주/야간('주간' '야간')
	private String	subject;		//대상자
	private int		price;			//가격
	private int		orderSeq;			//순서
	
	public int getChargeNo() {
		return chargeNo;
	}
	public void setChargeNo(int chargeNo) {
		this.chargeNo = chargeNo;
	}
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
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	
}//class end