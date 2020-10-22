package project.admin.e_p002.vo;


import org.springframework.stereotype.Component;

@Component
public class E_p002VO {
	
	private int prodNum; // 상품번호
	private int optionNum; // 옵션 번호	
	private String name; // 상품이름
	private String priceString; // 상품가격 스트링 변환
	private String prodsize; // 상품 사이즈
	private String color; // 상품 색상
	private String typeString; // 상품 타입 스트링 변환 (신상품 / 중고품)
	private String prodcategorynumString; // 상품 카테고리 스트링 변환 (반팔, 신발, 가방, 긴팔, 긴바지 등등)
	private String prodstatusString;// 상품 상태(판매중 / 품절) 스트링변환
	private String createdAtString; // 상품등록일자 스트링 변환
	private String updatedatString; // 상품수정일자 스트링 변환
	private int quantity; // 상품 재고
	private int price; // 상품 가격
	private int type; // 상품 타입
	private int prodstatus; //상품 상태
	private String content; //상품 내용
	private String pcontent; //상품 메인이미지 as
	private String pcontentDetail; //상품 디테일이미지 as
	private int pphotonum; //사진번호
	
	
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public int getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPriceString() {
		return priceString;
	}
	public void setPriceString(String priceString) {
		this.priceString = priceString;
	}
	public String getProdsize() {
		return prodsize;
	}
	public void setProdsize(String prodsize) {
		this.prodsize = prodsize;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getTypeString() {
		return typeString;
	}
	public void setTypeString(String typeString) {
		this.typeString = typeString;
	}
	public String getProdcategorynumString() {
		return prodcategorynumString;
	}
	public void setProdcategorynumString(String prodcategorynumString) {
		this.prodcategorynumString = prodcategorynumString;
	}
	public String getProdstatusString() {
		return prodstatusString;
	}
	public void setProdstatusString(String prodstatusString) {
		this.prodstatusString = prodstatusString;
	}
	public String getCreatedAtString() {
		return createdAtString;
	}
	public void setCreatedAtString(String createdAtString) {
		this.createdAtString = createdAtString;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPcontentDetail() {
		return pcontentDetail;
	}
	public void setPcontentDetail(String pcontentDetail) {
		this.pcontentDetail = pcontentDetail;
	}
	public String getUpdatedatString() {
		return updatedatString;
	}
	public void setUpdatedatString(String updatedatString) {
		this.updatedatString = updatedatString;
	}
	public int getProdstatus() {
		return prodstatus;
	}
	public void setProdstatus(int prodstatus) {
		this.prodstatus = prodstatus;
	}
	public int getPphotonum() {
		return pphotonum;
	}
	public void setPphotonum(int pphotonum) {
		this.pphotonum = pphotonum;
	}
	
	
	
	
	

}
