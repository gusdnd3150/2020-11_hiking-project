package project.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageController {
	
	public String mypageHome() throws Exception;
	public String profileView() throws Exception ;
	public String updateUserView() throws Exception;
	public String updateUser(HttpSession httpsession, RedirectAttributes rttr, LoginDTO loginDTO) throws Exception;
			
	}
	
