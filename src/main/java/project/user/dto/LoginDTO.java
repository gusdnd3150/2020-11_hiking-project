package project.user.dto;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@ToString
public class LoginDTO {
	
//	private int userNum;
	private String id;
	private String password;
	private String name;
	private String nickName;
	private int sex;
//	private String phone;
//	private String address;
//	private String email;
//	private int type;
//	private int status;
//	private Date createdAt;
//	private Date updatedAt;
	public boolean useCookie;

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

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	
	
	
}
