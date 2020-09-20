package project.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.user.dto.LoginDTO;
import project.user.service.UserService;
import project.user.vo.UserVO;

@Controller("userController")
@RequestMapping("/user/*")
public class UserControllerImpl implements UserController {
	public static final Logger logger = LoggerFactory.getLogger(UserControllerImpl.class);
	
	@Autowired
	UserService userService;
	
	//왜 UserVO를 Autowired 선언해주면 안되는거지??
	
	//회원가입 화면	
	@RequestMapping(value ="/signUpView", method= RequestMethod.GET)
	public String signUpView() throws Exception {
		logger.info("signUpView");
		return "/user/signUpView.jsp";
	}

	//회원가입 완료	
	@RequestMapping(value = "/insertUser", method=RequestMethod.POST)
	public String insertUser(UserVO userVO) throws Exception{
		logger.info("insertUser");
		userService.insertUser(userVO);
		return "redirect:/";
	}
	
	@RequestMapping(value ="/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) throws Exception {
		System.out.println(id);
		int rst = userService.idCheck(id);
		System.out.println("유저Controller : "+ rst);
		return rst;
	}

	@RequestMapping(value="/logInView", method=RequestMethod.GET)
	public String logInView() {
		System.out.println("로그인 페이지간다");
		return "/user/logInView.jsp";
	
	}

	@RequestMapping(value="/logIn", method=RequestMethod.POST)
	public ModelAndView logIn(LoginDTO loginDTO, HttpSession httpSession, ModelAndView mav) throws Exception {
		UserVO userVO = userService.logIn(loginDTO);
		System.out.println("로그인디티오"+loginDTO);
		System.out.println(userVO);
		if(userVO == null) { // 뭔가 더 해야 할 것 같은데 모르겠다. 
			System.out.println("널이었음");
			mav.setViewName("user/logIn.jsp");
			return mav;
		}
		mav.setViewName("home.jsp");
		mav.addObject("userVO", userVO);
		System.out.println("유저컨트롤러mav"+ mav);
		return mav;
	}

	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		Object object = httpSession.getAttribute("logIn");
		if(object != null) {
			httpSession.removeAttribute("logIn");
			httpSession.invalidate();
		}
		return "/user/logout.jsp";
	}
	
}
