package project.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.user.service.UserService;
import project.user.vo.UserVO;

@Controller("userController")
@RequestMapping("/user/*")
public class UserControllerImpl implements UserController {
	public static final Logger logger = LoggerFactory.getLogger(UserControllerImpl.class);
	
	@Autowired
	UserService userService;
	
	//회원가입 화면	
	@RequestMapping(value ="/user/signUpView", method= RequestMethod.GET)
	public void signUpView() throws Exception {
		logger.info("signUpView");
	}

	//회원가입 완료	
	@RequestMapping(value = "/user/insertUser", method=RequestMethod.POST)
	public String insertUser(UserVO userVO) throws Exception{
		logger.info("insertUser");
		userService.insertUser(userVO);
		return "redirect:/";
	}
	
	@RequestMapping(value ="/user/userIdCheck", method = RequestMethod.GET)
	@ResponseBody
	public int userIdCheck(@RequestParam("userId") String userId) throws Exception {
		System.out.println(userId);
		int rst = userService.userIdCheck(userId);
		System.out.println("Controller : "+ rst);
		return rst;
	}
}
