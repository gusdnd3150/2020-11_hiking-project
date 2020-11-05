package project.admin.e_p005.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.admin.e_p005.service.E_p005Service;
import project.admin.e_p005.vo.E_p005VO;



@Controller
public class E_p005ControllerImpl implements E_p005Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(E_p005ControllerImpl.class);

	@Autowired
	private E_p005Service e_p005Service; 
	
	@Autowired
	private E_p005VO e_p005VO; 

	//지정일자 매출 조회
	@Override
	@RequestMapping(value = "/admin/searchPayList.do", method = RequestMethod.GET)
	public ModelAndView searchPayList(@RequestParam(value="key_word",  defaultValue = "null") String key_word, @RequestParam("startDate")String startDate, @RequestParam("endDate")String endDate, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		Map<String, String> search_keyword = new HashMap<String, String>();
		search_keyword.put("startDate", startDate);
		search_keyword.put("endDate", endDate);
		search_keyword.put("key_word", key_word);
		
		List payList = e_p005Service.searchPayList(search_keyword);
		String sumPrice = e_p005Service.sumPrice(search_keyword);
		String avgPrice = e_p005Service.avgPrice(search_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p005_main");
		mav.addObject("payList", payList);
		mav.addObject("sumPrice", sumPrice);
		mav.addObject("avgPrice", avgPrice);
		return mav;
	}
	
	//지정일자 취소매출 조회
	@Override
	@RequestMapping(value = "/admin/cancelhPayList.do", method = RequestMethod.GET)
	public ModelAndView cancelhPayList(@RequestParam(value="key_word",  defaultValue = "null") String key_word, @RequestParam("startDate")String startDate,
			@RequestParam("endDate")String endDate, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, String> search_keyword = new HashMap<String, String>();
		search_keyword.put("startDate", startDate);
		search_keyword.put("endDate", endDate);
		search_keyword.put("key_word", key_word);
		
		List list = e_p005Service.cancelhPayList(search_keyword);
		String sumCancelPay = e_p005Service.sumCancelPay(search_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p005_main");
		mav.addObject("cancelPayList", list);
		mav.addObject("sumCancelPay", sumCancelPay);
		return mav;
	}
	

	//셀렉트 매출 조회
	@Override
	@RequestMapping(value = "/admin/selectSearch.do", method = RequestMethod.GET)
	public ModelAndView selectSearch(@RequestParam("key_word")String key_word,  @RequestParam(value="st",  required = false)String st,
			@RequestParam(value="end", required = false)String end, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> select_keyword = new HashMap<String, String>();
		
		select_keyword.put("startDate", st);
		select_keyword.put("endDate", end);
		select_keyword.put("key_word", key_word);
		
		List payList = e_p005Service.selectSearch(select_keyword);
		String sumPrice = e_p005Service.sumPrice(select_keyword);
		String avgPrice = e_p005Service.avgPrice(select_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p005_main");
		mav.addObject("payList", payList);
		mav.addObject("sumPrice", sumPrice);
		mav.addObject("avgPrice", avgPrice);
				
		return mav;
	}
	
	//셀렉트 취소매출
	@Override
	@RequestMapping(value = "/admin/cancelSearch.do", method = RequestMethod.GET)
	public ModelAndView cancelSearch(@RequestParam("key_word")String key_word,  @RequestParam(value="st",  required = false)String st,
			@RequestParam(value="end", required = false)String end, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, String> select_keyword = new HashMap<String, String>();
		select_keyword.put("startDate", st);
		select_keyword.put("endDate", end);
		select_keyword.put("key_word", key_word);
		List list = e_p005Service.cancelhPayList(select_keyword);
		String sumCancelPay = e_p005Service.sumCancelPay(select_keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p005_main");
		mav.addObject("cancelPayList", list);
		mav.addObject("sumCancelPay", sumCancelPay);
		return mav;
	}


	//금일 매출
	@Override
	@ResponseBody
	@RequestMapping(value = "admin/toDaySales.do", method = RequestMethod.POST)
	public String toDaySales(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("금일 매출 출력");
		return e_p005Service.toDaySales(map);
	}

	

}
