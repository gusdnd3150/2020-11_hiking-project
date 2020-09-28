package project.admin.e_p006.vo;

import org.springframework.stereotype.Component;

@Component
public class E_p006VO {
	private String csposttypeString; // 글구분 스트링
	private int csboardcnt; // 글 구분 카운트
	
	private String createdatString; // 매출일자
	private int sumPrice; // 매출 금액
	
	public String getCsposttypeString() {
		return csposttypeString;
	}
	public void setCsposttypeString(String csposttypeString) {
		this.csposttypeString = csposttypeString;
	}
	public int getCsboardcnt() {
		return csboardcnt;
	}
	public void setCsboardcnt(int csboardcnt) {
		this.csboardcnt = csboardcnt;
	}
	public String getCreatedatString() {
		return createdatString;
	}
	public void setCreatedatString(String createdatString) {
		this.createdatString = createdatString;
	}
	public int getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(int sumPrice) {
		this.sumPrice = sumPrice;
	}
	
	
	
	
}
