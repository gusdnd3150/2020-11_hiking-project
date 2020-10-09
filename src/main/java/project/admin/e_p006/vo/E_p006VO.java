package project.admin.e_p006.vo;

import org.springframework.stereotype.Component;

@Component
public class E_p006VO {
	//cs글 통계
	private String csposttypeString; // 글구분 스트링
	private int csboardcnt; // 글 구분 카운트
	
	//결제 통계
	private String createdatString; // 매출일자
	private int sumPrice; // 매출 금액
	
	//회원 통계
	private String userCreatedat; // 회원 가입일자
	private int man; // 남자
	private int woman; // 여자
	private int allUser; //전체 회원수
	
	
	
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
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getWoman() {
		return woman;
	}
	public void setWoman(int woman) {
		this.woman = woman;
	}
	public int getAllUser() {
		return allUser;
	}
	public void setAllUser(int allUser) {
		this.allUser = allUser;
	}
	public String getUserCreatedat() {
		return userCreatedat;
	}
	public void setUserCreatedat(String userCreatedat) {
		this.userCreatedat = userCreatedat;
	}	
	
}
