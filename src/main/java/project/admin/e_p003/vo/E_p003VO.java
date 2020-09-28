package project.admin.e_p003.vo;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

@Component
public class E_p003VO {
	   private int csPostNum;    //NUMBER NOT NULL 문의 번호
	   private int csBoardNum;   // NUMBER NOT NULL 게시판 번호
	   private int userNum;    //NUMBER NOT NULL 고객번호
	   private String title;    //VARCHAR2(50) 제목
	   private String content;    //VARCHAR2(4000) 문의 내용
	   private LocalDateTime createdAt;    //TIMESTAMP 셍성일자
	   private LocalDateTime updatedAt;    //TIMESTAMP 수정 일자
	   private int status;    //NUMBER NOT NULL 문의 상태 (1처리중, 2 완료)
	   private int csPostType;// 글 상태 구분(공지사항 100 )
	   
	   private String createdAtString;    //TIMESTAMP 셍성일자 스트링 변환
	   private String updatedAtString;    //TIMESTAMP 수정 일자 스트링 변환
	   private String statusString;    //NUMBER NOT NULL 문의 상태 (1처리중, 2 완료) 스트링 변환
	   private String csPostTypeString;    //NUMBER NOT NULL 글 부분 (공지사항 100, 문의사항 200, 신고글 300 )
	   
	   //-------------------글상세보기에 불러올 유저정보----------------------------------
	   private String id;
	   private String name;
	   private String email;
	  
	   
	   
	public int getCsPostNum() {
		return csPostNum;
	}
	public void setCsPostNum(int csPostNum) {
		this.csPostNum = csPostNum;
	}
	public int getCsBoardNum() {
		return csBoardNum;
	}
	public void setCsBoardNum(int csBoardNum) {
		this.csBoardNum = csBoardNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCreatedAtString() {
		return createdAtString;
	}
	public void setCreatedAtString(String createdAtString) {
		this.createdAtString = createdAtString;
	}
	public String getUpdatedAtString() {
		return updatedAtString;
	}
	public void setUpdatedAtString(String updatedAtString) {
		this.updatedAtString = updatedAtString;
	}
	public int getCsPostType() {
		return csPostType;
	}
	public void setCsPostType(int csPostType) {
		this.csPostType = csPostType;
	}
	public String getStatusString() {
		return statusString;
	}
	public void setStatusString(String statusString) {
		this.statusString = statusString;
	}
	public String getCsPostTypeString() {
		return csPostTypeString;
	}
	public void setCsPostTypeString(String csPostTypeString) {
		this.csPostTypeString = csPostTypeString;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	   
	   
	

}
