package project.user.dao;

import java.util.Map;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageDAO {
	
	
	
	public void updateUser(UserVO userVO) throws Exception; // 회원수정
	
	public void deleteUser(LoginDTO loginDTO) throws Exception; // 회원탈퇴

	public void updateUserCont(Map<String, Object> contMap);

	public void updateUserProf(Map<String, Object> profMap);

	public UserVO getUserInfo(String sessionId);

	public UserVO pwdCheck(String sessionId);

	public void updatePwd(UserVO userVO);

}
