package project.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageController {
	

	public UserVO updateUserView(HttpServletRequest request, ModelAndView mav, HttpSession httpSession) throws Exception;
	public UserVO modProfileView(HttpServletRequest request, ModelAndView mav, HttpSession httpSession) throws Exception;
	public String updateUser(HttpSession httpsession, RedirectAttributes rttr, UserVO userVO) throws Exception;
	public String updateUserInfo(MultipartHttpServletRequest file, HttpServletRequest request, 
			HttpServletResponse response, HttpSession httpSession) throws Exception;
	public int pwdCheck(@RequestParam("pwd") String pwd, HttpSession httpSession) throws Exception;
	}
	
