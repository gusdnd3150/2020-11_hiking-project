package project.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.user.service.MypageService;
import project.user.vo.UserVO;

@Controller
@RequestMapping("/mypage/*")
public class MypageControllerImpl implements MypageController{
	public static final Logger logger = LoggerFactory.getLogger(MypageControllerImpl.class);
	private static final String LOGIN = "LOGIN";

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
	
	@RequestMapping(value = "/mypage/modifyView", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateUserView(HttpServletRequest request, ModelAndView mav) throws Exception {
		HttpSession httpSession = request.getSession();
		logger.info("modifyView");	
		mav.addObject(httpSession.getAttribute(LOGIN));
		System.out.println("modyfy!!!!httpSession.getAttribute(LOGIN)"+httpSession.getAttribute(LOGIN));
		mav.setViewName("/user/modifyView.jsp");
		return mav;
	
	}
	
	@RequestMapping(value = "/mypage/updateUser", method = RequestMethod.POST)
	public String updateUser(HttpSession httpsession, RedirectAttributes rttr, UserVO userVO) throws Exception {
	mypageService.updateUser(userVO);
		httpsession.invalidate();
		return "/user/logInView.jsp";
			
	}
	
	

}
