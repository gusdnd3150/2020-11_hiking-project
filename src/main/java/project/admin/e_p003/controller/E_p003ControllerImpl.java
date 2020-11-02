package project.admin.e_p003.controller;

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

import com.google.gson.Gson;

import project.admin.e_p003.service.E_p003Service;
import project.admin.e_p003.vo.E_p003VO;



@Controller
public class E_p003ControllerImpl implements E_p003Controller{
	
	private static final Logger logger = LoggerFactory.getLogger(E_p003ControllerImpl.class);
	@Autowired
	private E_p003Service e_p003Service; 
	@Autowired
	private E_p003VO e_p003VO;
	
	
	//게시글 등록
	@Override
	@RequestMapping(value = "/admin/addCSboard.do", method = RequestMethod.POST)
	public ModelAndView addCSpost(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		int result = e_p003Service.addCSpost(map);

		ModelAndView mav = new ModelAndView("e_p003_main");
		mav.addObject("result", result);
		return mav;
	}
	
	//조건 검색
	@Override
	@RequestMapping(value = "/admin/csBoardsearch.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public ModelAndView searchCsBoard(@RequestParam(defaultValue="") String searchOption, @RequestParam(defaultValue="csPostNum") String key_word,  HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word", key_word);
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
		String viewType = e_p003Service.viewType(csPostNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p003_viewDateList");
		mav.addObject("viewDetaList", viewDetaList);
		mav.addObject("viewType", viewType);
		return mav;
	}
	
	//글 수정
	@Override
	@RequestMapping(value = "/admin/upDateCsboard.do", method = RequestMethod.POST)
	public ModelAndView upDateCsBoard(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response)throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		int result=e_p003Service.upDateCsBoard(map);
		mav.setViewName("e_p003_main");
		if(result !=0) {
			mav.addObject("upDatemsg", "ok");
			}else {
				mav.addObject("upDatemsg", "x");
			}
		return mav;	
	}
	
	//글삭제
	@Override
	@RequestMapping(value = "/admin/removeCsboard.do", method = RequestMethod.GET)
	@ResponseBody
	public String removeCsboard(@RequestParam("csPostNum")int csPostNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int result = e_p003Service.removeCsboard(csPostNum);
		if(result == 1) {
			return "ok";
		}else {
			return "x";
		}
		
	}
	

	//메일발송
	@Override
	@RequestMapping(value="/admin/sendMail.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendMail(@RequestParam Map<String, String> map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int mailResult = 0;
		mailResult=e_p003Service.mailSending(map);
		if(mailResult==1) {
			String msg = "ok";
			return msg;
		}else {
			String msg = "x";
			return msg;
		}
		
	}

	//문의글 카운트 알림
	@Override
	@ResponseBody
	@RequestMapping(value="/admin/countBoard.do", method=RequestMethod.POST)
	public String countBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("문의글 카운트");
		return e_p003Service.countBoard();
	}
	
}
