package project.user.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface UserController {
  
	public String signUpView() throws Exception;
	public String insertUser(UserVO userVO) throws Exception;
	public int idCheck(@RequestParam("id") String id) throws Exception;
	
	public String logInView();
	
	public ModelAndView logIn(LoginDTO loginDTO, HttpSession httpsession, ModelAndView mav) throws Exception;
	
	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) throws Exception;

}
