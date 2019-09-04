package kr.co.ziziza.admin.vo;

import org.apache.ibatis.type.Alias;

/**
 * AdminCompanyVO
 * @author Park
 * @version 19-07-18
 */
@Alias("AdminCompanyVO")
public class AdminCompanyVO {
	private int 	companyNo;
	private String 	companyKind;
	private String	companyName;
	private	String	zoneCode;
	private	String	address;
	private	String	detailAddress;
	private	String	companyTel;
	private	String	contents;
	private	String	openTime;
	private	String 	closeTime;
	private String	registDate;
	private char	state;
	private	int		mngNo;
	private	String	mngName;
	
	public int getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}
	public String getCompanyKind() {
		return companyKind;
	}
	public void setCompanyKind(String companyKind) {
		this.companyKind = companyKind;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getZoneCode() {
		return zoneCode;
	}
	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getCompanyTel() {
		return companyTel;
	}
	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
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
	public int getMngNo() {
		return mngNo;
	}
	public void setManagerNo(int mngNo) {
		this.mngNo = mngNo;
	}
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	public void setMngNo(int mngNo) {
		this.mngNo = mngNo;
	}
	
}//class end