package project.user.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.user.service.MypageService;
import project.user.service.UserService;
import project.user.vo.UserVO;

@Controller
@RequestMapping("/mypage/*")
public class MypageControllerImpl implements MypageController {
	public static final Logger logger = LoggerFactory.getLogger(MypageControllerImpl.class);
	private static final String LOGIN = "LOGIN";

	@Autowired
	MypageService mypageService;
	
	@Autowired
	UserService userService;

	@RequestMapping(value = "/mypage/modifyView.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView updateUserView(HttpServletRequest request, HttpSession httpSession)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		logger.info("modifyView.do");
		UserVO userVO = mypageService.getUserInfo(httpSession.getId());
		System.out.println(userVO);
		mav.addObject("userVO", userVO);
		mav.setViewName("/user/modifyView");
		return mav;
	}
	@RequestMapping(value = "/mypage/modProfile.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public UserVO modProfileView(HttpServletRequest request, ModelAndView mav, HttpSession httpSession)
			throws Exception {
		UserVO userVO = mypageService.getUserInfo(httpSession.getId());
		return userVO;

	}

	@RequestMapping(value = "/mypage/updateUser.do", method = RequestMethod.POST)
	public String updateUser(HttpSession httpSession, UserVO userVO) throws Exception {
		if (userVO.getPassword() != null) {
			logger.info("비밀번호 변경	");
			System.out.println(userVO.getPassword());
			String hashedPwd = BCrypt.hashpw(userVO.getPassword(), BCrypt.gensalt(10));
			userVO.setPassword(hashedPwd);
			userVO.setSessionId(httpSession.getId());
			System.out.println(userVO);
			mypageService.updatePwd(userVO);
			httpSession.invalidate();
			userService.removeSessionId(httpSession.getId());
			return "/user/logInView";
		}
		logger.info("updateUser");
		System.out.println(userVO);
		mypageService.updateUser(userVO);
		httpSession.invalidate();
		userService.removeSessionId(httpSession.getId());
		return "/user/logInView";

	}

	@RequestMapping(value = "/mypage/updateUserInfo.do", method = RequestMethod.POST)
	public String updateUserInfo(MultipartHttpServletRequest file, HttpServletRequest request,
			HttpServletResponse response, HttpSession httpSession) throws Exception {
		String sessionId = httpSession.getId();
		logger.info(sessionId);
		Map<String, Object> profMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String profile = (String) enu.nextElement();
			String profileValue = request.getParameter(profile);
			profMap.put(profile, profileValue);
			profMap.put("sessionId", sessionId);
			logger.info("proMap");
		}

		Map<String, Object> contMap = new HashMap<String, Object>();
		MultipartFile multiContent = file.getFile("content"); // 파일 형태로 받아서
		byte[] content = multiContent.getBytes(); // 파일 실제 내용 풀어내기
		contMap.put("content", content);
		contMap.put("sessionId", sessionId);
		logger.info("conMap");
		try {
			mypageService.updateUserProf(profMap);
			mypageService.updateUserCont(contMap);
			logger.info("service go!");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/user/mypageHome";
	}
	

	
	@RequestMapping(value = "/mypage/pwdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String pwdCheck(@RequestParam("pwd") String pwd, HttpSession httpSession) throws Exception {
		String rst = "1";
		logger.info("pwdCheck   :" + pwd);
		UserVO userVO = mypageService.pwdCheck(httpSession.getId());
		System.out.println(userVO);
		if (userVO == null || !BCrypt.checkpw(pwd, userVO.getPassword())) {
			return rst;
		}
		rst ="0";
		return rst;
	}
	
	
}
