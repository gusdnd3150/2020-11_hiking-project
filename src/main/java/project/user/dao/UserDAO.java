package project.user.dao;

import java.util.Date;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface UserDAO {

	@Transactional
	public void insertUser(UserVO userVO) throws Exception;

	@Transactional
	public void insertUser2(Map<String, Object> snsUser)throws Exception;

	
	public int idCheck(String id) throws Exception;
	
	
	public int emailCheck(String email) throws Exception;
	
	public int nickNameCheck(String nickName) throws Exception;
	
	public int idEmailCheck(Map<String, Object> map) throws Exception;
	
	public UserVO logIn(LoginDTO loginDTO) throws Exception; // 로그인
	
	@Transactional
	void keepLogIn(String id, String sessionId, Date sessionLimit) throws Exception;
	
	
	UserVO checkUserWithSessionKey(String value) throws Exception;

	public UserVO getBySns(Map<String, Object> snsUser);

	@Transactional
	public void removeSessionId(String sessionId);

	@Transactional
	public void updateAuthKey(Map<String, String> map);

	@Transactional
	public void updateAuthStatus(Map<String, String> map);

	@Transactional
	public void withdrawal(UserVO userVO);

	
	public String searchId(String email);

	
	public int selectUserNum(String id);



}
