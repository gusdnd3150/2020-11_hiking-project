package project.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int userIdCheck(String userId) throws Exception{
		int rst = sqlSession.selectOne("userMapper.userIdCheck", userId);
	System.out.println("DAO : "+ rst);
		return rst;
	}

}
