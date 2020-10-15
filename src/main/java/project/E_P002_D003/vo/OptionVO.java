package project.E_P002_D003.vo;

import org.springframework.stereotype.Component;

@Component
public class OptionVO {
	
	private int optionNum;
	private int prodNum;
	private String prodSize;
	private String color;
	private int quantity;
	private int prodstatus;
	private String updateDate;
	private String modDate;
	
	public int getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public String getProdSize() {
		return prodSize;
	}
	public void setProdSize(String prodSize) {
		this.prodSize = prodSize;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProdstatus() {
		return prodstatus;
	}
	public void setProdstatus(int prodstatus) {
		this.prodstatus = prodstatus;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	

}
