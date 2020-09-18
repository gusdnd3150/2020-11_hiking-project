package project.user.vo;

import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;


@Data
public class UserVO {
	
	private int userNum;
	private String id;
	private String password;
	private String name;
	private int sex;
	private String phone;
	private String address;
	private String email;
	private int type;
	private int status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
}
