package project.admin.e_p001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.admin.e_p001.service.E_p001Service;
import project.admin.e_p001.vo.E_p001VO;

@Controller
public class E_p001ControllerImpl implements E_p001Controller {
	private static final Logger logger = LoggerFactory.getLogger(E_p001ControllerImpl.class);

	@Autowired
	private E_p001Service e_p001Service;
	@Autowired
	private E_p001VO e_p001VO;

	// 어드민 메인 화면 컨트롤러
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "admin/admin_home";
	}

	@Override // 회원등록
	@RequestMapping(value = "admin/addUser.do", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("e_p001VO") E_p001VO e_p001VO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = e_p001Service.addUser(e_p001VO);
		ModelAndView mav = new ModelAndView("e_p001_main");
		mav.addObject("userName", e_p001VO.getName());
		return mav;
	}

	@Override // 회원 조건검색
	@RequestMapping(value = "admin/searchUser.do", method = RequestMethod.POST)
	public ModelAndView searchUser(@RequestParam(defaultValue = "") String searchOption,
			@RequestParam(defaultValue = "userNum") String key_word, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word", key_word);
		search.put("searchOption", searchOption);
		List userList = e_p001Service.userSearch(search);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p001_main");
		mav.addObject("userList", userList);
		return mav;
	}

	//데이터 테이블 (회원 상태 수정)
	@Override
	@ResponseBody
	@RequestMapping(value = "admin/upDateUser.do", method = RequestMethod.GET)
	public String upDateUser(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int result = e_p001Service.upDateUser(map);
		if (result != 0) {
			return "ok";
		}
		return "x";
	}

	//고객정보 상세보기
	@Override
	@RequestMapping(value = "admin/userView.do", method = RequestMethod.GET)
	public ModelAndView userView(@RequestParam(value="userNum") int userNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("상세보기 회원 번호           "+userNum);
		
		List list = e_p001Service.userView(userNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p001_userView");
		//mav.setViewName("e_p001_main");
		mav.addObject("list", list);
		return mav;
	}



}
