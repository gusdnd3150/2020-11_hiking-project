package project.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import project.user.dto.LoginDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	

	@Override
	public void updateUser(LoginDTO loginDTO) throws Exception {
		sqlSession.update("userMapper.updateUser", loginDTO);
	
	
	}

	@Override
	public void deleteUser(LoginDTO loginDTO) throws Exception {
		sqlSession.delete("userMapper.deleteUser", loginDTO);		
	}

}
