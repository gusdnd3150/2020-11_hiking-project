package project.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.user.dao.UserDAO;
import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	public static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserDAO userDAO;
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertUser(UserVO userVO) throws Exception {
		userDAO.insertUser(userVO);
	}

	@Override
	public int idCheck(String id) throws Exception{
		int rst = userDAO.idCheck(id);
		System.out.println("Service : "+ rst);
		return rst;
	}
	
	@Override
	public int emailCheck(String email) throws Exception {
		int rst = userDAO.emailCheck(email);
		System.out.println("Service : "+ rst);
		return rst;
	}
	
	public UserVO logIn(LoginDTO loginDTO) throws Exception {
		System.out.println("서비스왔다감");
		return userDAO.logIn(loginDTO);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date sessionLimit) throws Exception {
		logger.info("------keepLogInService------");
		userDAO.keepLogIn(id, sessionId, sessionLimit);
		
	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return userDAO.checkUserWithSessionKey(value);
	}

	@Override
	public UserVO getBySns(Map<String, Object> snsUser) {
		return userDAO.getBySns(snsUser);
	}

	@Override
	public void insertUser2(Map<String, Object> snsUser) throws Exception {
		userDAO.insertUser2(snsUser);
	}

	@Override
	public void removeSessionId(String sessionId) {
		userDAO.removeSessionId(sessionId);
		
	}

	@Override
	public void updateAuthKey(Map<String, String> map) {
		userDAO.updateAuthKey(map);
		
	}

	@Override
	public void updateAuthStatus(Map<String, String> map) {
		userDAO.updateAuthStatus(map);
	}

	@Override
	public void withdrawal(UserVO userVO) {
		userDAO.withdrawal(userVO);
		
	}

	@Override
	public String searchId(String email) {
		return userDAO.searchId(email);
		
	}

	
}
