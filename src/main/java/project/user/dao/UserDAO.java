package project.user.dao;

import java.util.Date;
import java.util.Map;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface UserDAO {

	public void insertUser(UserVO userVO) throws Exception;

	public int idCheck(String id) throws Exception;
	
	public UserVO logIn(LoginDTO loginDTO) throws Exception; // 로그인
	
	void keepLogIn(String id, String sessionId, Date sessionLimit) throws Exception;
	
	UserVO checkUserWithSessionKey(String value) throws Exception;


	public UserVO getBySns(Map<String, Object> snsUser);

	public void insertUser2(Map<String, Object> snsUser);

	public void removeSessionId(String sessionId);

}
