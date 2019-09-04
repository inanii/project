package kr.co.ziziza.admin.vo;

import org.apache.ibatis.type.Alias;

/**
 * AdminPlantsVO
 * @author Park
 * @version 19-07-18
 */
@Alias("AdminPlantsVO")
public class AdminPlantsVO {
	private	int		companyNo;
	private String	plantName;
	private	String	etcContent;
	
	public int getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}
	public String getPlantName() {
		return plantName;
	}
	public void setPlantName(String plantName) {
		this.plantName = plantName;
	}
	public String getEtcContent() {
		return etcContent;
	}
	public void setEtcContent(String etcContent) {
		this.etcContent = etcContent;
	}
	
}//class end