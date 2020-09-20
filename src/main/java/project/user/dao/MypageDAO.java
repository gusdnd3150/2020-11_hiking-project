package project.user.dao;

import org.springframework.web.servlet.ModelAndView;

import project.user.dto.LoginDTO;

public interface MypageDAO {
	
	
	
	public void updateUser(LoginDTO loginDTO) throws Exception; // 회원수정
	
	public void deleteUser(LoginDTO loginDTO) throws Exception; // 회원탈퇴

}
