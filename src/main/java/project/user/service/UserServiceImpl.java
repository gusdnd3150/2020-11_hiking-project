package project.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import project.user.dao.UserDAO;
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
	public int userIdCheck(String userId) throws Exception{
		int rst = userDAO.userIdCheck(userId);
		System.out.println("Service : "+ rst);
		return rst;
	}
}
