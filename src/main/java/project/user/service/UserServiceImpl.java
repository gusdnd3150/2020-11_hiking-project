package project.user.service;

import java.util.Date;
import java.util.List;
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
	public int idCheck(String id) throws Exception {
		int rst = userDAO.idCheck(id);
		return rst;
	}

	@Override
	public int emailCheck(String email) throws Exception {
		int rst = userDAO.emailCheck(email);
		return rst;
	}

	@Override
	public int nickNameCheck(String nickName) throws Exception {
		int rst = userDAO.nickNameCheck(nickName);
		return rst;
	}

	@Override
	public int idEmailCheck(Map<String, Object> map) throws Exception {
		int rst = userDAO.idEmailCheck(map);
		return rst;
	}

	public UserVO logIn(LoginDTO loginDTO) throws Exception {
		return userDAO.logIn(loginDTO);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date sessionLimit) throws Exception {
		// logger.info("------keepLogInService------");
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

	public int selectUserNum(String id) {
		return userDAO.selectUserNum(id);
	}

	@Override
	public Map<String, Integer> mandateCheck(String id) {
		return userDAO.mandateCheck(id);
	}

	@Override
	public List<Map> memberCheck(String id) {
		return userDAO.memberCheck(id);
	}

	@Override
	public void withdrawUserUpdateStatus(List<Map> memberC) {
		userDAO.withdrawUserUpdateStatus(memberC);
	}

}
