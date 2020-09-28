package project.user.service;

import java.util.Map;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageService {
	
	
	
	public void updateUser(UserVO userVO) throws Exception; // 회원수정
	
	public void deleteUser(LoginDTO loginDTO) throws Exception; // 회원탈퇴

	public void updateUserCont(Map<String, Object> contMap);

	public void updateUserProf(Map<String, Object> profMap);

	public UserVO getUserInfo(String string);

	public UserVO pwdCheck(String sessionId);

	public void updatePwd(UserVO userVO);



}
