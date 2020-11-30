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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.B_P003_D001.service.B_P003_D001productService;
import project.common.ThumbnailMaker;
import project.commu.CommuService;
import project.group.GroupService;
import project.group.GroupVO;
import project.mountain.MountainService;
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
	
	@Autowired        //쇼핑몰관련
	B_P003_D001productService b_P003_D001productService;
	
	
	@Autowired
	ThumbnailMaker thumbnailMaker;
	
//	@Autowired
//	UserVO userVO;
	
	@Autowired
	CommuService commuService;

	@Autowired
	MountainService mountainService;

	@Autowired
	GroupService groupService;

	@RequestMapping(value = "/mypage/mypageHomeView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageHomeView(HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();
		UserVO userVO = new UserVO();
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		String id = userVO.getId();
		userVO = mypageService.getUserInfo(userVO);
		List<Map> CList = commuService.selectCreatedCommu(id); 
		List<Map> JList = commuService.selectJoinedCommu(id);
		
		
	 	////쇼핑몰관련///
		int userNum = userService.selectUserNum(id);         //유저넘
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userNum", userNum);
		map.put("orderType", 2);
		map.put("listType", 100);
		int usedCount = b_P003_D001productService.totaladdUsed(map);
		int wishCount =b_P003_D001productService.wishCount(userNum);
		int cartCount = b_P003_D001productService.CartTotal(map);
		int total = b_P003_D001productService.totalPaymentCount(map);
		Map<String,Object> point =b_P003_D001productService.buyerinfo(map);
		mav.addObject("usedCount",usedCount); //중고접수 카운트
		mav.addObject("buyCount",total); //구매수량
		mav.addObject("point",point);  //보유포인트
		mav.addObject("cartCount",cartCount); // 장바구니 수량
		mav.addObject("wishCount",wishCount); // 위시리스트 수량

		mav.addObject("userVO", userVO);
		mav.addObject("CList", CList);
		mav.addObject("JList", JList);
		mav.setViewName("/user/mypageHome");
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
		}
		return "redirect:/mypage/mypageHomeView.do";
	}

	@RequestMapping(value = "/mypage/pwdCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String pwdCheck(@RequestParam("pwd") String pwd, HttpSession httpSession) throws Exception {
		UserVO userVO = new UserVO();
		String rst = "1";
		logger.info("pwdCheck   :" + pwd);
		userVO.setId((String) httpSession.getAttribute(LOGIN));
		userVO = mypageService.pwdCheck(userVO);
		if (userVO == null || !BCrypt.checkpw(pwd, userVO.getPassword())) {
			return rst;
		}
		rst = "0";
		return rst;
	}

	@GetMapping("/mypage/moim.do")
	public ModelAndView myMoim(@RequestParam("userId")String id){
		ModelAndView mav = new ModelAndView("/user/mymoim");
		List<Map> CList = commuService.selectCreatedCommu(id);
		List<Map> JList = commuService.selectJoinedCommu(id);

		mav.addObject("CList", CList);
		mav.addObject("JList", JList);
		return mav;
	}

	@GetMapping("/mypage/favorite.do")
	public ModelAndView myFavorite(@RequestParam("userId")String userId){
		ModelAndView mav = new ModelAndView("/user/myfavorite");
		List trail = mountainService.selectTrailLikeById(userId);
		List group = groupService.selectGroupLikeById(userId);

		mav.addObject("trail",trail);
		mav.addObject("group",group);
		return mav;
	}
}
