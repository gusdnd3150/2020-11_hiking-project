package project.E_P002_D003.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class E_P002_D003PhotoVO {
	
	private int PRODNUM; //상품번호
	private int PPHOTONUM; //사진번호
	private String CREATEDAT;  //등록일자
	private String UPDATEDAT; //수정일자
	private byte[] CONTENTImage; //상품사진
	
	public int getPRODNUM() {
		return PRODNUM;
	}
	public void setPRODNUM(int pRODNUM) {
		PRODNUM = pRODNUM;
	}
	public int getPPHOTONUM() {
		return PPHOTONUM;
	}
	public void setPPHOTONUM(int pPHOTONUM) {
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
	public byte[] getCONTENTImage() {
		return CONTENTImage;
	}
	public void setCONTENTImage(byte[] cONTENTImage) {
		CONTENTImage = cONTENTImage;
	}
	
	

}
