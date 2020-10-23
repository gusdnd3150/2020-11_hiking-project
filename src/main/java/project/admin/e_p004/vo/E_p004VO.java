package project.admin.e_p004.vo;

import org.springframework.stereotype.Component;

@Component
public class E_p004VO {
	private int orderNum; //주문번호
	private String orderDatString; // 주문시간 String
	private int orderStatus; // 주문상태 (1.결제전   2.결제완료  3.결제취소)
	private int deliverystatus; // 배송상태(100.입금대기  200.입금완료   300.배송준비  400.배송완료)
	private String prodName;// 상품명
	private String prodSize; // 상품 사이즈
	private String color; //상품 컬러
	private int quantity; // 주문수량
	private String content; // 주문상품 이미지
	private String custName; // 주문자이름
	private String custPhone; // 주문자 전화번호
	private String zoneCode; // 우편번호
	private String address; // 주소
	private String address2; //상세주소
	private String orderStatusString; //주문상태 스트링 변환
	
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderDatString() {
		return orderDatString;
	}
	public void setOrderDatString(String orderDatString) {
		this.orderDatString = orderDatString;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getDeliverystatus() {
		return deliverystatus;
	}
	public void setDeliverystatus(int deliverystatus) {
		this.deliverystatus = deliverystatus;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustPhone() {
		return custPhone;
	}
	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
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
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getOrderStatusString() {
		return orderStatusString;
	}
	public void setOrderStatusString(String orderStatusString) {
		this.orderStatusString = orderStatusString;
	}
	
}
