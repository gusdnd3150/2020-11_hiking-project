package project.E_P002_D003.vo;

import org.springframework.stereotype.Component;

//@Component
public class E_P002_D003ProductsVO {
	
     private int prodNum;//상품번호
     private int pCategoryNum;		//상품분류코드
     private String name;		//상품명
     private int price;		//상품가격(단가)
     private String content;	    	//상품내용
     private int type;		//상품구분
     private String createDat;	//등록일자
     private String updateDat;		//수정일자
     
     
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

	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
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
