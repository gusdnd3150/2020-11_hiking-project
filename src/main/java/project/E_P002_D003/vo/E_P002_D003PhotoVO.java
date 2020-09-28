package project.E_P002_D003.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class E_P002_D003PhotoVO {
	
	private int prodNum; //상품번호
	private int pPhotoNum; //사진번호
	private String createDat;  //등록일자
	private String upDateDat; //수정일자
	private byte[] content; //상품사진
	
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public int getpPhotoNum() {
		return pPhotoNum;
	}
	public void setpPhotoNum(int pPhotoNum) {
		this.pPhotoNum = pPhotoNum;
	}
	public String getCreateDat() {
		return createDat;
	}
	public void setCreateDat(String createDat) {
		this.createDat = createDat;
	}
	public String getUpDateDat() {
		return upDateDat;
	}
	public void setUpDateDat(String upDateDat) {
		this.upDateDat = upDateDat;
	}
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}

	
	
	

}
