package project.admin.e_p002.vo;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

@Component
public class E_p002VO {
	
		//상품
	  private int prodNum; //상품 번호
	  private int pCategoryNum; //상품 분류코드
	  private String name; //상품이름   
	  private int price; //상품가격  
	  private String content; //상품 내용    
	  private int quantity; //상품수량   
	  private int  type; //상품 구분 (신제품, 중고품)   
	  private LocalDateTime  createdAt; //상품 등록일자 
	  private LocalDateTime  updatedAt;  // 상품 수정일자
	  
	  //상품사진	
	  private int pPhotoNum; //사진번호
	  private String pcontent; //사진  저장이름
	  private String fileSize; //사진  저장이름
	  private String originalFilename ; //사진  저장이름
	  
	  private String pCategoryNumStirng ; //상품 분류코드 스트링
	  private String typeString ; //상품 구분 스트링
	  private String createdAtString ; //상품 등록일 스트링
	  private String priceString ; //상품 등록일 스트링
	  
	  
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public int getpCategoryNum() {
		return pCategoryNum;
	}
	public void setpCategoryNum(int pCategoryNum) {
		this.pCategoryNum = pCategoryNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	public int getpPhotoNum() {
		return pPhotoNum;
	}
	public void setpPhotoNum(int pPhotoNum) {
		this.pPhotoNum = pPhotoNum;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getpCategoryNumStirng() {
		return pCategoryNumStirng;
	}
	public void setpCategoryNumStirng(String pCategoryNumStirng) {
		this.pCategoryNumStirng = pCategoryNumStirng;
	}
	public String getTypeString() {
		return typeString;
	}
	public void setTypeString(String typeString) {
		this.typeString = typeString;
	}
	public String getCreatedAtString() {
		return createdAtString;
	}
	public void setCreatedAtString(String createdAtString) {
		this.createdAtString = createdAtString;
	}
	public String getPriceString() {
		return priceString;
	}
	public void setPriceString(String priceString) {
		this.priceString = priceString;
	}
	    
	  

}
