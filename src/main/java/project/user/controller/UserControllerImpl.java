package project.user.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.plexus.util.StringUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import project.user.auth.SNSLogin;
import project.user.auth.SnsValue;
import project.user.dto.LoginDTO;
import project.user.service.UserService;
import project.user.vo.UserVO;

@Controller("userController")
@RequestMapping("/user/*")
public class UserControllerImpl implements UserController {

	public static final Logger logger = LoggerFactory.getLogger(UserControllerImpl.class);
	private static final String LOGIN = "LOGIN";
	
	@Autowired
	UserService userService;

	@Autowired
	private SnsValue naverSns;

//	@Autowired
//	private SnsValue googleSns;
	
	@Autowired
	public UserControllerImpl(UserService userService) {
		this.userService=userService;
	}

	// 회원가입 완료
	@RequestMapping(value = "/insertUser.do", method = RequestMethod.POST)
	public String insertUser(UserVO userVO) throws Exception {
		System.out.println(userVO);
		String hashedPw = BCrypt.hashpw(userVO.getPassword(), BCrypt.gensalt(10));
		userVO.setPassword(hashedPw);
		logger.info("insertUser");
		userService.insertUser(userVO);
		return "redirect:/";
	}

	@RequestMapping(value = "/insertUser2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertUser2(@ModelAttribute("snsUser") Map<String, Object> snsUser, LoginDTO loginDTO,
			RedirectAttributes reAttr) throws Exception {
		System.out.println("##############" + snsUser);
		loginDTO.setId((String) snsUser.get("id"));
		loginDTO.setPassword((String) snsUser.get("password"));
		String hashedPw = BCrypt.hashpw((String)snsUser.get("password"), BCrypt.gensalt());
		snsUser.put("password", hashedPw);
		logger.info("insertUser2");
		userService.insertUser2(snsUser);
		reAttr.addFlashAttribute("loginDTO", loginDTO);

		return "redirect:/user/logIn.do";
	}

	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) throws Exception {
		System.out.println(id);
		int rst = userService.idCheck(id);
		String result ="0";
		System.out.println("유저Controller : " + rst);
		if(rst==1) {
			result="1";
		}
		return result;
	}

	@RequestMapping(value = "/logInView.do", method = RequestMethod.GET)
	public String logInView(Model model) {
		System.out.println("로그인 페이지간다");
		SNSLogin naverLogin = new SNSLogin(naverSns);
//		SNSLogin googleLogin = new SNSLogin(googleSns);
		model.addAttribute("naver_url", naverLogin.getNaverAuthURL());
//		model.addAttribute("google_url", googleLogin.getGoogleAuthURL());
		return "/user/logInView";

	}

	@RequestMapping(value = "{snsService}/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String snsLoginCallBack(@PathVariable String snsService, @RequestParam String code,
			RedirectAttributes reAttr, HttpSession httpSession) throws Exception {
		logger.info("snsLoginCallback: service={}", snsService);
		SnsValue sns = null;
		if (StringUtils.equals("naver", snsService)) 
			sns = naverSns;
//		else 
//			sns = googleSns;
		
		SNSLogin snsLogin = new SNSLogin(sns);
		Map<String, Object> snsUser = snsLogin.getUserProfile(code);
		System.out.println("Profile>>" + snsUser);
		UserVO snsUserInfo = userService.getBySns(snsUser);
		System.out.println("********"+snsUserInfo);
		if (snsUserInfo == null) {
			System.out.println("여기는 왔겠지.");
			httpSession.setAttribute("snsUser", snsUser);
			return "/user/insertPwdView";
		} else {
			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setId(snsUserInfo.getId());
			httpSession.setAttribute("loginDTO", loginDTO);
			return "/user/snsUserPwdCheck";
		}
	

	}
	
	@RequestMapping(value = "/insertPwd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertPwd(@RequestParam("password2") String password2, HttpSession httpSession, RedirectAttributes reAttr)
			throws Exception {
		Map<String, Object> snsUser = (Map<String, Object>) httpSession.getAttribute("snsUser");
		httpSession.removeAttribute("snsUser");
		snsUser.put("password", password2);
		reAttr.addFlashAttribute("snsUser", snsUser);
		return "redirect:/user/insertUser2.do";
	}
	
	@RequestMapping(value = "/user/snsUserPwdCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String snsUserPwdCheck(@RequestParam("password") String password, HttpSession httpSession, RedirectAttributes reAttr)
			throws Exception {
		LoginDTO loginDTO =(LoginDTO) httpSession.getAttribute("loginDTO");
				loginDTO.setPassword(password);
		reAttr.addFlashAttribute("loginDTO", loginDTO);
		return "redirect:/user/logIn.do";
	}
	
	@RequestMapping(value = "/logIn.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logIn(HttpServletRequest request, LoginDTO loginDTO, HttpSession httpSession, ModelAndView mav)
			throws Exception {
		System.out.println("로그인디티오" + loginDTO);
//		//로그인 전에 DB 같은 sessionID 있으면 삭제
//		System.out.println(httpSession.getId());
//		userService.removeSessionId(httpSession.getId());
		UserVO userVO = userService.logIn(loginDTO);
		System.out.println(userVO);
		
			if (userVO == null || !BCrypt.checkpw(loginDTO.getPassword(), userVO.getPassword())) {
			System.out.println("널......");
			mav.setViewName("/user/logIn");
			return mav;
		} System.out.println("도대체 어디로 간거니?1");
		mav.setViewName("/home");
		mav.addObject("userVO", userVO);
		System.out.println("유저컨트롤러mav------" + mav);
		
		// 로그인 유지를 선택할 경우
		if (loginDTO.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7; // 7일
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));// 로그인 유지기간 설정
			userService.keepLogin(userVO.getId(), httpSession.getId(), sessionLimit);
			System.out.println("세션아이디 저장");
		}
	
		System.out.println("도대체 어디로 간거니?3");
		return mav;
	}

	@RequestMapping(value = "/logOut.do", method = RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		Object object = httpSession.getAttribute("LOGIN");
		if (object != null) {
			UserVO userVO = (UserVO) object;
			httpSession.removeAttribute("LOGIN");
			httpSession.invalidate();
			userService.removeSessionId(httpSession.getId());
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				userService.keepLogin(userVO.getId(), "none", new Date());
			}
		}
		return "/user/logOut";
	}



}
