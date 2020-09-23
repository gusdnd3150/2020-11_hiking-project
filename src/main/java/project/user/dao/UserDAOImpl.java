package project.user.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{
	
	public static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertUser(UserVO userVO) throws Exception{
		sqlSession.insert("userMapper.insertUser", userVO);
		
	}

	@Override
	public int idCheck(String id) throws Exception{
		System.out.println("다오아이디: "+id);
		int rst = sqlSession.selectOne("userMapper.idCheck", id);
	System.out.println("DAO : "+ rst);
		return rst;
	}
	
	@Override
	public UserVO logIn(LoginDTO loginDTO) throws Exception {
		System.out.println("다오왔다감");
		return sqlSession.selectOne("userMapper.logIn", loginDTO);
	}

	@Override
	public void keepLogIn(String id, String sessionId, Date sessionLimit) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		logger.info("------keepLogInDAO------");
		System.out.println(sessionId);
		paramMap.put("id", id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);

		sqlSession.update("userMapper.keepLogin", paramMap);
	}
	
	

	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		logger.info("------checkUserWithSessionKeyDAO------");
		return sqlSession.selectOne("userMapper.checkUserWithSessionKey", value);
	}

}