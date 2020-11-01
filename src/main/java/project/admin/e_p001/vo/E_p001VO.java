package project.admin.e_p001.vo;

import java.time.LocalDateTime;
import org.springframework.stereotype.Component;

@Component
public class E_p001VO  {

	 private int userNum;
	 private String id;
	 private String password;
	 private String name;  
	 private int sex;   //(남자 1 / 여자 2)
	 private String phone;   
	 private String address;  
	 private String email;   
	 private int type;   	//고객유형 (관리자 100 / 회원 200 / 비회원 300)
	 private LocalDateTime createdAt; //등록일자
	 private LocalDateTime updatedAt; //수정일자
	 
	 private int status; 	//고객상태 (활동 10 / 휴면 20)
	 
	 private String sexType; // 성별 유형 담을 객체  
	 private String usersType;  //유저 타입 담을 객체
	 private String statusType;  // 유저 상태 담을 객체
	 
	 private String createdAtString;// 등록일자 스트링 변환
	 private String updatedAtString; // 수정일자 스트링 변환
	 
	 private String zoneCode; //우편번호 
	 private String address2; //상세 주고
	 private String profile; //자기소개
	 private String content2; //프로필사진
	 private String nickname; //닉네임
	 private String totalpoint; //보유포인트
	 
	 
	 
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getSexType() {
		return sexType;
	}
	public void setSexType(String sexType) {
		this.sexType = sexType;
	}
	public String getUsersType() {
		return usersType;
	}
	public void setUsersType(String usersType) {
		this.usersType = usersType;
	}
	public String getStatusType() {
		return statusType;
	}
	public void setStatusType(String statusType) {
		this.statusType = statusType;
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
	public String getZoneCode() {
		return zoneCode;
	}
	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTotalpoint() {
		return totalpoint;
	}
	public void setTotalpoint(String totalpoint) {
		this.totalpoint = totalpoint;
	}
	
	 
	 
	 
	 
}