package project.E_P002_D003.vo;

import org.springframework.stereotype.Component;

@Component
public class E_P002_D003ProductsVO {
	
     private String PRODNUM;	//상품번호
     private String PCATEGORYNUM;		//상품분류코드
     private String NAME;		//상품명
     private String PRICE;		//상품가격(단가)
     private String CONTENT;	    	//상품내용
     private String QUANTITY;		//상품수량
     private String TYPE;		//상품구분
     private String CREATEDAT;	//등록일자
     private String UPDATEDAT;		//수정일자
     
	public String getPRODNUM() {
		return PRODNUM;
	}
	public void setPRODNUM(String pRODNUM) {
		PRODNUM = pRODNUM;
	}
	public String getPCATEGORYNUM() {
		return PCATEGORYNUM;
	}
	public void setPCATEGORYNUM(String pCATEGORYNUM) {
		PCATEGORYNUM = pCATEGORYNUM;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPRICE() {
		return PRICE;
	}
	public void setPRICE(String pRICE) {
		PRICE = pRICE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getQUANTITY() {
		return QUANTITY;
	}
	public void setQUANTITY(String qUANTITY) {
		QUANTITY = qUANTITY;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getCREATEDAT() {
		return CREATEDAT;
	}
	public void setCREATEDAT(String cREATEDAT) {
		CREATEDAT = cREATEDAT;
	}
	public String getUPDATEDAT() {
		return UPDATEDAT;
	}
	public void setUPDATEDAT(String uPDATEDAT) {
		UPDATEDAT = uPDATEDAT;
	}
    
    

}
