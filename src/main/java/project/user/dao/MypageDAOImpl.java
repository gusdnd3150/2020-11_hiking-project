package project.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	

	@Override
	public void updateUser(UserVO userVO) throws Exception {
		System.out.println("마이페이지다오업데이트:"+ userVO);
		sqlSession.update("userMapper.updateUser", userVO);
	
	
	}

	@Override
	public void deleteUser(LoginDTO loginDTO) throws Exception {
		sqlSession.delete("userMapper.deleteUser", loginDTO);		
	}

}
