package project.user.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface UserController {
  
	//public String signUpView() throws Exception;
	public ModelAndView insertUser(UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView resendMail(UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String insertUser2(HttpSession httpSession, LoginDTO loginDTO,  RedirectAttributes reAttr) throws Exception;
	
	public String idCheck(@RequestParam("id") String id) throws Exception;
	
	public String emailCheck(@RequestParam("email") String email) throws Exception;
	
	public String nickNameCheck(@RequestParam("nickName") String nickName) throws Exception;
	
	public String idEmailCheck(@RequestParam("email") String email, @RequestParam("id") String id) throws Exception; 
	
	public String insertPwd(@RequestParam("password2") String password2, HttpSession httpSession, RedirectAttributes reAttr, HttpServletRequest request)
			throws Exception;
	
	public String logInView(Model model);
	
	public String snsLoginCallBack(@PathVariable String snsService, @RequestParam String code, 
			RedirectAttributes reAttr, HttpSession httpSession)throws Exception;
	
	public ModelAndView logIn( LoginDTO loginDTO, HttpSession httpsession, ModelAndView mav) throws Exception;
	
	public String withdrawal(UserVO userVO, HttpSession httpSession) throws Exception;
	
	public ModelAndView withdrawalCheck(HttpSession httpSession) throws Exception;

	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession httpsession) throws Exception;
	
	public String searchId(@RequestParam("email") String email, HttpServletRequest request) throws Exception;
	
	
	public String sendTempPwd(@RequestParam("id") String id, @RequestParam("email") String email,
			HttpServletRequest request) throws Exception ;
	

}
