package project.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.user.dto.LoginDTO;
import project.user.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageControllerImpl implements MypageController{
	public static final Logger logger = LoggerFactory.getLogger(MypageControllerImpl.class);

	@Autowired
	MypageService mypageService; 
	
	//마이페이지 화면
	@RequestMapping(value ="/mypage/mypageHome", method= RequestMethod.GET)
	public String mypageHome() throws Exception {
	logger.info("mypageHome");
	return "/user/mypageHome.jsp";
		
	}

	
	@RequestMapping(value = "/mypage/profileView", method = RequestMethod.GET)
	public String profileView() throws Exception {
		logger.info("profileView");
		return "/user/profileView.jsp";
	}
	
	@RequestMapping(value = "/mypage/updateUserView", method = RequestMethod.GET)
	public String updateUserView() throws Exception {
		logger.info("modify");	
		return "/user/modify.jsp";
	
	}
	
	@RequestMapping(value = "/mypage/updateUser", method = RequestMethod.POST)
	public String updateUser(HttpSession httpsession, RedirectAttributes rttr, LoginDTO loginDTO) throws Exception {
	mypageService.updateUser(loginDTO);
		httpsession.invalidate();
		return "/user/profileView.jsp";
			
	}
	
	

}
