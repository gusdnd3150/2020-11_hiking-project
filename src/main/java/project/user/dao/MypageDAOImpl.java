package project.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Repository;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	

	@Override
	public void updateUser(UserVO userVO) throws Exception {
		sqlSession.update("userMapper.updateUser", userVO);
		sqlSession.update("userMapper.updateUser2", userVO);
	}

	@Override
	public void deleteUser(LoginDTO loginDTO) throws Exception {
		sqlSession.delete("userMapper.deleteUser", loginDTO);		
	}

	@Override
	public void updateUserProf(Map<String, Object> profMap) {
		sqlSession.update("userMapper.updateUserProf", profMap);		
	}

	@Override
	public int updateUserCont(Map map) {
	            sqlSession.update("userMapper.updateUserCont", map);
		return 0;
	}


	@Override
	public UserVO getUserInfo(UserVO userVO) {
		int userNum =  sqlSession.selectOne("userMapper.selectUserNum", userVO);
		return sqlSession.selectOne("userMapper.getUserInfo", userNum);
	}

	@Override
	public UserVO pwdCheck(UserVO userVO) {
		return sqlSession.selectOne("userMapper.pwdCheck", userVO);
	}

	@Override
	public void updatePwd(UserVO userVO) {
		sqlSession.selectOne("userMapper.updatePwd", userVO);
	}



}
