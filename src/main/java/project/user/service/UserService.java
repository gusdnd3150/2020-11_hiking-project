package project.user.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface UserService {

	public void insertUser(UserVO userVO) throws Exception;

	public void insertUser2(Map<String, Object> snsUser) throws Exception;

	public int idCheck(String id) throws Exception;

	public int emailCheck(String email) throws Exception;

	public int nickNameCheck(String nickName) throws Exception;

	public int idEmailCheck(Map<String, Object> map) throws Exception;

	public UserVO logIn(LoginDTO loginDTO) throws Exception; // 로그인

	void keepLogin(String id, String sessionId, Date sessionLimit) throws Exception;

	UserVO checkLoginBefore(String value) throws Exception;

	UserVO getBySns(Map<String, Object> snsUser);

	public void removeSessionId(String sessionId);

	public void updateAuthKey(Map<String, String> map);

	public void updateAuthStatus(Map<String, String> map);

	public void withdrawal(UserVO userVO);

	public String searchId(String email);

	public int selectUserNum(String id);

	public Map<String, Integer> mandateCheck(String id);

	public List<Map> memberCheck(String id);

	public void withdrawUserUpdateStatus(List<Map> memberC);

}
