package project.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import project.common.ThumbnailMaker;
import project.commu.CommuService;
import project.group.GroupVO;
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

	@Autowired
	ThumbnailMaker thumbnailMaker;

//	@Autowired
//	UserVO userVO;

	@Autowired
	CommuService commuService;

	@RequestMapping(value = "/mypage/mypageHomeView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageHomeView(HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();
		UserVO userVO = new UserVO();
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		String id = userVO.getId();
		userVO = mypageService.getUserInfo(userVO);
		if (userVO.getContent2() == null || userVO.getContent2().equals("")) {
			userVO.setContent2("userBasic.jpg");
		}
		List<Map> CList = commuService.selectCreatedCommu(id);
		List<Map> JList = commuService.selectJoinedCommu(id);

		System.out.println("컨트롤러: " + CList);

		mav.addObject("userVO", userVO);
		mav.addObject("CList", CList);
		mav.addObject("JList", JList);
		mav.setViewName("/user/mypageHome");
		System.out.println("갖다준당 : " + userVO);
		return mav;
	}

	@RequestMapping(value = "/mypage/modifyView.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public ModelAndView updateUserView(HttpSession httpSession) throws Exception {
		UserVO userVO = new UserVO();
		ModelAndView mav = new ModelAndView();
		logger.info("modifyView.do");
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		userVO = mypageService.getUserInfo(userVO);
		mav.addObject("userVO", userVO);
		mav.setViewName("/user/modifyView");
		return mav;
	}

	@RequestMapping(value = "/mypage/modProfile.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public UserVO modProfileView(HttpServletRequest request, ModelAndView mav, HttpSession httpSession)
			throws Exception {
		UserVO userVO = new UserVO();
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		userVO = mypageService.getUserInfo(userVO);
		return userVO;
	}

	@RequestMapping(value = "/mypage/updateUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateUser(HttpSession httpSession, UserVO userVO) throws Exception {
		if (!userVO.getPassword().equals("")) {
			logger.info("비밀번호 변경	");
			System.out.println("바뀐 비밀번호" + userVO.getPassword());
			String hashedPwd = BCrypt.hashpw(userVO.getPassword(), BCrypt.gensalt(10));
			userVO.setPassword(hashedPwd);
			userVO.setId((String) httpSession.getAttribute(LOGIN));
			mypageService.updatePwd(userVO);
			httpSession.invalidate();
			userService.removeSessionId(httpSession.getId());
			return "/user/modifyEnd";
		}
		logger.info("updateUser");
		mypageService.updateUser(userVO);
		httpSession.invalidate();
		userService.removeSessionId(httpSession.getId());
		return "/user/modifyEnd";
	}

	@RequestMapping(value = "/mypage/updateUserInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateUserInfo(@RequestParam String profile,
			@RequestParam(value = "file", required = false) MultipartFile fileP, HttpServletRequest request,
			HttpSession httpSession) throws Exception {
		String id = (String) httpSession.getAttribute(LOGIN);
		int userNum = userService.selectUserNum(id);
		Map<String, Object> profMap = new HashMap<String, Object>();
		profMap.put("profile", profile);
		profMap.put("userNum", userNum);
		mypageService.updateUserProf(profMap);
		logger.info("profMap");

		if (!fileP.isEmpty()) {
			String path = request.getSession().getServletContext().getRealPath("/");
			int mediaResult = mypageService.updateUserCont(userNum, fileP, path);
			System.out.println("mediaResult: " + mediaResult);
		}
		return "redirect:/mypage/mypageHomeView.do";
	}

	@RequestMapping(value = "/mypage/pwdCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String pwdCheck(@RequestParam("pwd") String pwd, HttpSession httpSession) throws Exception {
		UserVO userVO = new UserVO();
		String rst = "1";
		logger.info("pwdCheck   :" + pwd);
		System.out.println((String) httpSession.getAttribute(LOGIN));
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		System.out.println(userVO.getId());
		userVO = mypageService.pwdCheck(userVO);
		if (userVO == null || !BCrypt.checkpw(pwd, userVO.getPassword())) {
			return rst;
		}
		rst = "0";
		return rst;
	}

}
