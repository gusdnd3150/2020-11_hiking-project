package project.B_P003_D001.vo;

import org.springframework.stereotype.Component;

@Component
public class PointVO {
	
	private int userNum;
	private String startDate;
	private String endDate;
	private int type;
	private int used;
	private int result;
	private int orderNum;
	private String createDat;
	private String updateDat;
	private int payType;
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getUsed() {
		return used;
	}
	public void setUsed(int used) {
		this.used = used;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
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
	public int getPayType() {
		return payType;
	}
	public void setPayType(int payType) {
		this.payType = payType;
	}
	
	
	
	
}
