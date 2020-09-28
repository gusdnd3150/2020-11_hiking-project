package project.admin.e_p005.vo;

import org.springframework.stereotype.Component;

@Component
public class E_p005VO {
	
	private String createdateString; // 스프링 변환 결제일자
	private String orderNum; // 주문번호
	private String userNum; // 회원번호
	private String pay1; // 카드결제
	private String pay2; // 무통장입금
	private String sumPrice; // 합계 매출
	private String avgPrice; // 평균 매출
	
	public String getCreatedateString() {
		return createdateString;
	}
	public void setCreatedateString(String createdateString) {
		this.createdateString = createdateString;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
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
		
}
