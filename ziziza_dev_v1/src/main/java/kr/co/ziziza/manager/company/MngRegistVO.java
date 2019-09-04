package kr.co.ziziza.manager.company;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("MngRegistVO")
public class MngRegistVO {
	private	int		companyNo;		//사업장고유번호
	private String	companyKind;	//사업장종류('찜질방' '사우나' '목욕탕')
	private String 	companyName;	//상호명
	private String	zoneCode;		//소재지
	private String	address;		//소재지
	private String	detailAddress;		//소재지
	private String 	companyTel;		//전화번호
	private String 	contents;		//사업장소개글
	private String	openTime;		//영업시작시간
	private String	closeTime;		//영업마감시간
	private String 	registDate;		//등록일
	private char 	state;			//상태('Y'등록 'N'미등록)
	private MultipartFile imgChumbu;
	private int		mngNo;			//사업자번호
	private int 	bannerNo;
	private String	event_content;		//프로모션 내용
	
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	private List<MngChargeVO> chargeList;
	private List<MngPlantsVO> plantList;
	
	public List<MngPlantsVO> getPlantList() {
		return plantList;
	}
	public void setPlantList(List<MngPlantsVO> plantList) {
		this.plantList = plantList;
	}
	public List<MngChargeVO> getChargeList() {
		return chargeList;
	}
	public void setChargeList(List<MngChargeVO> chargeList) {
		this.chargeList = chargeList;
	}
	public int getBannerNo() {
		return bannerNo;
	}
	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public void setMngNo(int mngNo) {
		this.mngNo = mngNo;
	}
	public MultipartFile getImgChumbu() {
		return imgChumbu;
	}
	public void setImgChumbu(MultipartFile imgChumbu) {
		this.imgChumbu = imgChumbu;
	}
	public String getZoneCode() {
		return zoneCode;
	}
	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
}
