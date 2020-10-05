package project.user.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.common.ThumbnailMaker;
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

	@Autowired
	UserVO userVO;

	@RequestMapping(value = "/mypage/modifyView.do", produces="application/json", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView updateUserView(HttpSession httpSession)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		logger.info("modifyView.do");
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		userVO = mypageService.getUserInfo(userVO);
		mav.addObject("userVO", userVO);
		mav.setViewName("/user/modifyView");
		return mav;
	}

	@RequestMapping(value = "/mypage/modProfile.do", produces="application/json", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public UserVO modProfileView(HttpServletRequest request, ModelAndView mav, HttpSession httpSession)
			throws Exception {
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		userVO = mypageService.getUserInfo(userVO);
		return userVO;
	}

	@RequestMapping(value = "/mypage/contentView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<byte[]> contentView(HttpServletRequest req, HttpServletResponse res,
			HttpSession httpSession)throws Exception {
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		mypageService.getUserInfo(userVO);
		byte[] content2 = userVO.getContent2();
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
	return new ResponseEntity<byte[]>(content2, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/mypage/updateUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateUser(HttpSession httpSession, UserVO userVO) throws Exception {
		if (!userVO.getPassword().equals("")) {
			logger.info("비밀번호 변경	");
			System.out.println("바뀐 비밀번호"+userVO.getPassword());
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
	public String updateUserInfo(MultipartHttpServletRequest file, HttpServletRequest request,
			HttpServletResponse response, HttpSession httpSession) throws Exception {
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		String id=userVO.getId();
		Map<String, Object> profMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String profile = (String) enu.nextElement();
			String profileValue = request.getParameter(profile);
			profMap.put(profile, profileValue);
			profMap.put("id", id);
			logger.info("profMap");
		}

		Map<String, Object> contMap = new HashMap<String, Object>();
		MultipartFile multiContent = file.getFile("content"); // 파일 형태로 받아서
		byte[] content = multiContent.getBytes(); // 파일 실제 내용 풀어내기
		byte[] content2 = thumbnailMaker.createThumbnail(multiContent, 100, 100);
		contMap.put("content", content);
		contMap.put("content2", content2);
		contMap.put("id", id);
		logger.info("contMap");
		try {
			mypageService.updateUserProf(profMap);
			mypageService.updateUserCont(contMap);
			logger.info("service go!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/user/mypageHome";
	}
	

	@RequestMapping(value = "/mypage/pwdCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String pwdCheck(@RequestParam("pwd") String pwd, HttpSession httpSession) throws Exception {
		String rst = "1";
		logger.info("pwdCheck   :" + pwd);
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		userVO = mypageService.pwdCheck(userVO);
		if (userVO == null || !BCrypt.checkpw(pwd, userVO.getPassword())) {
			return rst;
		}
		rst ="0";
		return rst;
	}
	
	
}
