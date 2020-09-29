package project.user.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface UserController {
  
	//public String signUpView() throws Exception;
	public String insertUser(UserVO userVO) throws Exception;
	public String insertUser2(@RequestParam("snsUser") Map<String, Object> snsUser, LoginDTO loginDTO,  RedirectAttributes reAttr) throws Exception;
	public String idCheck(@RequestParam("id") String id) throws Exception;
	public String insertPwd(@RequestParam("password2") String password2, HttpSession httpSession, RedirectAttributes reAttr)
			throws Exception;
	public String logInView(Model model);
	public String snsLoginCallBack(@PathVariable String snsService, @RequestParam String code, 
			RedirectAttributes reAttr, HttpSession httpSession)throws Exception;
	public ModelAndView logIn(HttpServletRequest request, LoginDTO loginDTO, HttpSession httpsession, ModelAndView mav) throws Exception;
	
	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) throws Exception;

}
