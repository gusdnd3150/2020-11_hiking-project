package project.B_P003_D001.vo;

import org.springframework.stereotype.Component;

@Component
public class DeliveryVO {

	private int userNum;
	private String custName;
	private int custPhonNum;
	private int deliNum;
	private String address;
	private String address2;
	private int zonecode;
	private String createDat;
	private String updateDat;
	private int deliBasic;
	
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public int getCustPhonNum() {
		return custPhonNum;
	}
	public void setCustPhonNum(int custPhonNum) {
		this.custPhonNum = custPhonNum;
	}
	public int getDeliNum() {
		return deliNum;
	}
	public void setDeliNum(int deliNum) {
		this.deliNum = deliNum;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getZonecode() {
		return zonecode;
	}
	public void setZonecode(int zonecode) {
		this.zonecode = zonecode;
	}
	public String getCreateDat() {
		return createDat;
	}
	public void setCreateDat(String createDat) {
		this.createDat = createDat;
	}
	public String getUpdateDat() {
		return updateDat;
	}
	public void setUpdateDat(String updateDat) {
		this.updateDat = updateDat;
	}
	public int getDeliBasic() {
		return deliBasic;
	}
	public void setDeliBasic(int deliBasic) {
		this.deliBasic = deliBasic;
	}
	
	
	
	
	
	
}
