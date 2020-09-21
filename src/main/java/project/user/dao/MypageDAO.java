package project.user.dao;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageDAO {
	
	
	
	public void updateUser(UserVO userVO) throws Exception; // 회원수정
	
	public void deleteUser(LoginDTO loginDTO) throws Exception; // 회원탈퇴

}
