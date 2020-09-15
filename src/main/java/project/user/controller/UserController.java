package project.user.controller;

import org.springframework.web.bind.annotation.RequestParam;

import project.user.vo.UserVO;

public interface UserController {
  
	public void signUpView() throws Exception;
	public String insertUser(UserVO userVO) throws Exception;
	public int userIdCheck(@RequestParam("userId") String user_id) throws Exception;
	
	

}
