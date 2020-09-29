package project.user.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserVO {
	private int userNum;
	private String id;
	private String password;
	private String name;
	private int sex;
	private String phone;
	private String zonecode;
	private String address;
	private String address2;
	private String email;
	private int type;
	private int status;
	private String createdAt;
	private String updatedAt;
	private String sex2;
	private String sessionId;
	private Date sessionLimit;
	private String profile; //자기소개글
	private Byte[] content; //프로필사진
}
