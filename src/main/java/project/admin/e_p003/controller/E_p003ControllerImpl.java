package project.admin.e_p003.controller;

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


import project.admin.e_p003.service.E_p003Service;
import project.admin.e_p003.vo.E_p003VO;



@Controller
public class E_p003ControllerImpl implements E_p003Controller{
	
	private static final Logger logger = LoggerFactory.getLogger(E_p003ControllerImpl.class);
	@Autowired
	private E_p003Service e_p003Service; 
	@Autowired
	private E_p003VO e_p003VO;
	
	
	//공지사항 등록
	@Override
	@RequestMapping(value = "/admin/addCSboard.do", method = RequestMethod.POST)
	public ModelAndView addCSpost(@ModelAttribute("e_p003VO")E_p003VO e_p003VO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result=e_p003Service.addCSpost(e_p003VO);
		ModelAndView mav = new ModelAndView("e_p003_main");
		mav.addObject("result", result);
		return mav;
	}
	
	//조건 검색
	@Override
	@RequestMapping(value = "/admin/csBoardsearch.do", method = RequestMethod.POST)
	public ModelAndView searchCsBoard(@RequestParam(defaultValue="") String searchOption, 
			@RequestParam(defaultValue="csPostNum") String key_word,
			@RequestParam(required=false) String key_word1, 
			HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word", key_word);
		search.put("key_word1", key_word1);
		search.put("searchOption", searchOption);
		List csBoardList = e_p003Service.searchCsBoard(search);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p003_main");
		mav.addObject("csBoardList", csBoardList);
		return mav;
	}
	
	//상세보기
	@Override
	@RequestMapping(value = "/admin/viewDetaList.do", method =  RequestMethod.GET)
	public ModelAndView viewDetaList(@RequestParam("csPostNum") int csPostNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		List viewDetaList = e_p003Service.viewDetaList(csPostNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p003_viewDateList");
		mav.addObject("viewDetaList", viewDetaList);
		return mav;
	}
	
	//글 수정
	@Override
	@RequestMapping(value = "/admin/upDateCsboard.do", method = RequestMethod.POST)
	public ModelAndView upDateCsBoard(@ModelAttribute("e_p003VO") E_p003VO e_p003VO, HttpServletRequest request, HttpServletResponse response)throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int result = 0;
		result=e_p003Service.upDateCsBoard(e_p003VO);
		ModelAndView mav = new ModelAndView();
		if(result == 1) {
			mav.addObject("upDateCsBoardMsg", result);
		}else {
			mav.addObject("upDateCsBoardMsg", result);
		}
		mav.setViewName("e_p003_main");
		return mav;
	}
	
	//글삭제
	@Override
	@RequestMapping(value = "/admin/removeCsboard.do", method = RequestMethod.GET)
	@ResponseBody
	public int removeCsboard(@RequestParam("csPostNum")int csPostNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int result = e_p003Service.removeCsboard(csPostNum);
		if(result == 1) {
			return result;
		}else {
			return 0;
		}
		
	}
	
	//이메일 버틑 클릭후  회원 이메일 값 전달 및 폼 이동 메소드
	@Override
	@RequestMapping(value="/admin/sendEmail.do", method=RequestMethod.GET)
	public ModelAndView mailForm(@RequestParam("userEmail")String userEmail, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userEmail", userEmail);
		mav.setViewName("e_p003_emailForm");
		return mav;
	}

	//메일발송
	@Override
	@RequestMapping(value="/admin/mailSending.do", method=RequestMethod.POST)
	public ModelAndView mailSending(@RequestParam Map<String, String> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		int mailResult = 0;
		mailResult=e_p003Service.mailSending(map);
		if(mailResult==1) {
			mav.addObject("mailResult", mailResult);
		}else {
			mav.addObject("mailResult", mailResult);
		}
		mav.setViewName("e_p003_main");
		
		return mav;
	}
	
}
