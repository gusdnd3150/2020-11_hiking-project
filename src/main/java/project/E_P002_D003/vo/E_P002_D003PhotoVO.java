package project.E_P002_D003.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

//@Component
public class E_P002_D003PhotoVO {
	
	private int prodNum; //상품번호
	private int pPhotoNum; //사진번호
	private String createDat;  //등록일자
	private String upDateDat; //수정일자
	private String content; //상품사진
	private String originalFileName; //원본파일이름
	private String fileSize; //파일 사이즈
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
	
	
}
