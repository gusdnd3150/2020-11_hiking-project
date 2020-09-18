package project.user.service;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageService {
	
	
	
	public void updateUser(LoginDTO loginDTO) throws Exception; // 회원수정
	
	public void deleteUser(LoginDTO loginDTO) throws Exception; // 회원탈퇴


}
