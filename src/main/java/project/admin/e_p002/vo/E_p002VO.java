package project.admin.e_p002.vo;


import org.springframework.stereotype.Component;

@Component
public class E_p002VO {
	
	private int prodNum;
	private int optionNum;
	private String name;
	private String priceString;
	private String prodsize;
	private String color;
	private String typeString;
	private String prodcategorynumString;
	private String prodstatusString;
	private String createdAtString;
	private int quantity;
	
	
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPriceString() {
		return priceString;
	}
	public void setPriceString(String priceString) {
		this.priceString = priceString;
	}
	public String getProdsize() {
		return prodsize;
	}
	public void setProdsize(String prodsize) {
		this.prodsize = prodsize;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getTypeString() {
		return typeString;
	}
	public void setTypeString(String typeString) {
		this.typeString = typeString;
	}
	public String getProdcategorynumString() {
		return prodcategorynumString;
	}
	public void setProdcategorynumString(String prodcategorynumString) {
		this.prodcategorynumString = prodcategorynumString;
	}
	public String getProdstatusString() {
		return prodstatusString;
	}
	public void setProdstatusString(String prodstatusString) {
		this.prodstatusString = prodstatusString;
	}
	public String getCreatedAtString() {
		return createdAtString;
	}
	public void setCreatedAtString(String createdAtString) {
		this.createdAtString = createdAtString;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}
	

}
