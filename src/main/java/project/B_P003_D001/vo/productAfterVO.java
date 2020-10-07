package project.B_P003_D001.vo;

import org.springframework.stereotype.Component;

@Component
public class productAfterVO {
	
	private int userNum; //유저 아이디
	private int	afterNum;  //후기 번호
	private int prodNum;  // 상품번호
	private String content;  //후기내용
	private int afterType;   //후기 타입 (댓글/원글)
	private byte[] photo;   //사진
	private String createDat; 
	private String updateDat;
	private int evalue;      //평점
	private int lvl;        //계층 구조 레벨
	
	
	
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getEvalue() {
		return evalue;
	}
	public void setEvalue(int evalue) {
		this.evalue = evalue;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getAfterNum() {
		return afterNum;
	}
	public void setAfterNum(int afterNum) {
		this.afterNum = afterNum;
	}
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAfterType() {
		return afterType;
	}
	public void setAfterType(int afterType) {
		this.afterType = afterType;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
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
	

}
