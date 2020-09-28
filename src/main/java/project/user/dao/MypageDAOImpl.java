package project.user.dao;

import java.util.Map;

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

	@Override
	public void updateUserCont(Map<String, Object> contMap) {
		System.out.println("1");
		sqlSession.update("userMapper.updateUserInfo", contMap);			
	}

	@Override
	public void updateUserProf(Map<String, Object> profMap) {
		System.out.println("2");
		sqlSession.update("userMapper.updateUserInfo", profMap);		
	}

	@Override
	public UserVO getUserInfo(String sessionId) {
		return sqlSession.selectOne("userMapper.checkUserWithSessionKey", sessionId);
	}

	@Override
	public UserVO pwdCheck(String sessionId) {
		return sqlSession.selectOne("userMapper.pwdCheck", sessionId);
	}

	@Override
	public void updatePwd(UserVO userVO) {
		sqlSession.selectOne("userMapper.updatePwd", userVO);
	}

}
