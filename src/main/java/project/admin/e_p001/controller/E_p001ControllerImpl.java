package project.admin.e_p001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import project.admin.e_p001.service.E_p001Service;
import project.admin.e_p001.vo.E_p001VO;

@Controller
public class E_p001ControllerImpl implements E_p001Controller{
	private static final Logger logger = LoggerFactory.getLogger(E_p001ControllerImpl.class);
	
	@Autowired
	private E_p001Service e_p001Service;
	@Autowired
	private E_p001VO e_p001VO;
	
	// 임시 회원관리 페이지 이동 메소드
		@RequestMapping(value="admin/e_p001/" ,method= RequestMethod.GET)
		private ModelAndView form( HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/user_main.jsp");
			//mav.setViewName("admin/search.jsp");
			//mav.setViewName("admin/addUserForm.jsp");
			return mav;
		}

	
	@Override //회원등록
	@RequestMapping(value="admin/e_p001/addUser.do", method= RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("e_p001VO") E_p001VO e_p001VO, HttpServletRequest request, HttpServletResponse response)throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result=e_p001Service.addUser(e_p001VO);
		ModelAndView mav = new ModelAndView("admin/main");
		mav.addObject("userName", e_p001VO.getName());
		return mav;
	}
	
	@Override //회원 조건검색
	@RequestMapping(value="admin/e_p001/search.do", method= RequestMethod.POST)
	public ModelAndView searchUser(@RequestParam(defaultValue="") String searchOption, @RequestParam(defaultValue="userNum") String key_word, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("서치 옵션:"+searchOption);
		System.out.println("키워드내용:"+key_word);
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word", key_word);
		search.put("searchOption", searchOption);
		List userList = e_p001Service.userSearch(search);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/user_main.jsp");
		mav.addObject("userList", userList);
		return mav;
	}

	@Override //삭제
	@RequestMapping(value="admin/e_p001/removeUser.do", method =RequestMethod.GET)
	@ResponseBody
	public int removeUser(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int result = e_p001Service.removeUser(id);
		if(result == 1) {
			return result;
		}else {
			return 0;
		}
		
	}

	@Override // 회원정보 수정
	@RequestMapping(value="admin/e_p001/upDate.do", method= RequestMethod.POST)
	public ModelAndView upDateUser(@ModelAttribute("e_p001VO")E_p001VO e_p001VO, HttpServletRequest request, HttpServletResponse response)throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result=e_p001Service.upDateUser(e_p001VO);
		ModelAndView mav = new ModelAndView();
		if(result == 1) {
			mav.addObject("upDateMsg", result);
		}else {
			mav.addObject("upDateMsg", result);
		}
		mav.setViewName("admin/user_main.jsp");
		return mav;
	}

	@Override // 수정전 회원 정보 출력
	@RequestMapping(value="admin/e_p001/upDateUserList.do", method =RequestMethod.GET)
	public ModelAndView upDateUserList(@RequestParam("userNum") String userNum, HttpServletRequest request, HttpServletResponse response)throws Exception {
		List upDateUser = e_p001Service.upDateUserList(userNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/upDateUserForm.jsp");
		mav.addObject("upDateUser", upDateUser);
		return mav;
	}

	

}
