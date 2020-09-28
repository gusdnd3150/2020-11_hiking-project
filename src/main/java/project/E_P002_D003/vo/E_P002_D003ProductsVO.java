package project.E_P002_D003.vo;

import org.springframework.stereotype.Component;

@Component
public class E_P002_D003ProductsVO {
	
     private String prodNum;//상품번호
     private int pCategoryNum;		//상품분류코드
     private String name;		//상품명
     private String price;		//상품가격(단가)
     private String content;	    	//상품내용
     private String quantity;		//상품수량
     private String type;		//상품구분
     private String createDat;	//등록일자
     private String updateDat;		//수정일자
     
	public String getProdNum() {
		return prodNum;
	}
	public void setProdNum(String prodNum) {
		this.prodNum = prodNum;
	}
	public int getPcateGoryNum() {
		return pCategoryNum;
	}
	public void setPcateGoryNum(int pcateGoryNum) {
		this.pCategoryNum = pcateGoryNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
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
