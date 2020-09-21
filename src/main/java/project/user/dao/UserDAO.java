package project.user.dao;

import java.util.Date;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface UserDAO {

	public void insertUser(UserVO userVO) throws Exception;

	public int idCheck(String id) throws Exception;
	
	public UserVO logIn(LoginDTO loginDTO) throws Exception; // 로그인
	
	void keepLogIn(String id, String sessionId, Date sessionLimit) throws Exception;
	
	UserVO checkUserWithSessionKey(String value) throws Exception;

}
