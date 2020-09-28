package project.user.dto;

import lombok.Data;
import lombok.Getter;

@Data
public class LoginDTO {
	
//	private int userNum;
	private String id;
	private String password;
//	private String name;
//	private int sex;
//	private String phone;
//	private String address;
//	private String email;
//	private int type;
	private int status;
//	private Date createdAt;
//	private Date updatedAt;
	@Getter
	public boolean useCookie = true;

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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
}
