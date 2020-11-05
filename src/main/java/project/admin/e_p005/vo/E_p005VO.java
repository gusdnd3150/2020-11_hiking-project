package project.admin.e_p005.vo;

import org.springframework.stereotype.Component;

@Component
public class E_p005VO {
	
	private String createdateString; // 스프링 변환 결제일자
	private int orderNum; // 주문번호
	private int userNum; // 회원번호
	private String pay1; // 카드결제
	private String pay2; // 무통장입금
	private String sumPrice; // 합계 매출
	private String avgPrice; // 평균 매출
	
	
	private String sumCancelPay; // 취소매출 합계
	private String cancelcreatedate; // 취소 승일일자
	private String name; // 고객이름
	private String totalCancelPay; // 일자별 취소금액
	private String reason; // 취소사유
	
	
	
	public String getCreatedateString() {
		return createdateString;
	}
	public void setCreatedateString(String createdateString) {
		this.createdateString = createdateString;
	}
	public String getPay1() {
		return pay1;
	}
	public void setPay1(String pay1) {
		this.pay1 = pay1;
	}
	public String getPay2() {
		return pay2;
	}
	public void setPay2(String pay2) {
		this.pay2 = pay2;
	}
	public String getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(String sumPrice) {
		this.sumPrice = sumPrice;
	}
	public String getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(String avgPrice) {
		this.avgPrice = avgPrice;
	}
	public String getSumCancelPay() {
		return sumCancelPay;
	}
	public void setSumCancelPay(String sumCancelPay) {
		this.sumCancelPay = sumCancelPay;
	}
	public String getCancelcreatedate() {
		return cancelcreatedate;
	}
	public void setCancelcreatedate(String cancelcreatedate) {
		this.cancelcreatedate = cancelcreatedate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTotalCancelPay() {
		return totalCancelPay;
	}
	public void setTotalCancelPay(String totalCancelPay) {
		this.totalCancelPay = totalCancelPay;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
		
}
