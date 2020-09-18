package project.E_P002_D003.file;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class E_P002_D003PhotoVO {
	
	private String PRODNUM2; //상품번호
	private String PPHOTONUM; //사진번호
	//private int PPHOTONUM; //사진번호
	private String CREATEDAT;  //등록일자
	private String UPDATEDAT; //수정일자
	//private byte[] pPhotoContent;
	private MultipartFile CONTENT1; //상품사진
	private MultipartFile CONTENT2;
	private MultipartFile CONTENT3;
	private MultipartFile CONTENT4;
	
	public String getPRODNUM2() {
		return PRODNUM2;
	}
	public void setPRODNUM2(String pRODNUM2) {
		PRODNUM2 = pRODNUM2;
	}
	public String getPPHOTONUM() {
		return PPHOTONUM;
	}
	public void setPPHOTONUM(String pPHOTONUM) {
		PPHOTONUM = pPHOTONUM;
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
	public MultipartFile getCONTENT1() {
		return CONTENT1;
	}
	public void setCONTENT1(MultipartFile cONTENT1) {
		CONTENT1 = cONTENT1;
	}
	public MultipartFile getCONTENT2() {
		return CONTENT2;
	}
	public void setCONTENT2(MultipartFile cONTENT2) {
		CONTENT2 = cONTENT2;
	}
	public MultipartFile getCONTENT3() {
		return CONTENT3;
	}
	public void setCONTENT3(MultipartFile cONTENT3) {
		CONTENT3 = cONTENT3;
	}
	public MultipartFile getCONTENT4() {
		return CONTENT4;
	}
	public void setCONTENT4(MultipartFile cONTENT4) {
		CONTENT4 = cONTENT4;
	}
	
	
	
	

}
