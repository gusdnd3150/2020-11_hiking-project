package project.admin.e_p006.controller;


import java.util.HashMap;
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

import project.admin.e_p006.service.E_p006Service;
import project.admin.e_p006.vo.E_p006VO;

@Controller
public class E_p006ControllerImpl implements E_p006Controller{
	
	private static final Logger logger = LoggerFactory.getLogger(E_p006ControllerImpl.class);
	
	@Autowired
	private E_p006Service e_p006Service;
	
	@Autowired
	private E_p006VO e_p006VO;

		//지정일자 조회 cs 게시글  파이 차트
		@Override
		@ResponseBody
		@RequestMapping(value = "/admin/searchDatePieChart.do", method = RequestMethod.GET)
		public JSONObject searchDatePieChart(@RequestParam("startDate") String startDate,  @RequestParam("endDate") String endDate, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			Map<String, String> search_keyword = new HashMap<String, String>();
			search_keyword.put("startDate", startDate);
			search_keyword.put("endDate", endDate);
			return e_p006Service.searchDatePieChart(search_keyword);
		}
	
		//지정일자 조회 매출 현황  컬럼 차트
		@Override
		@ResponseBody
		@RequestMapping(value = "/admin/searchDateColumnChart.do", method = RequestMethod.GET)
		public JSONObject searchDateColumnChart(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			Map<String, String> search_keyword = new HashMap<String, String>();
			search_keyword.put("startDate", startDate);
			search_keyword.put("endDate", endDate);
			return e_p006Service.searchDateColumnChart(search_keyword);
		}
		
		// 지정일자 조회 가입자 현황 라인 차트
		@Override
		@ResponseBody
		@RequestMapping(value = "/admin/serchUserLineChart.do", method = RequestMethod.GET)
		public JSONObject serchUserLineChart(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			Map<String, String> search_keyword = new HashMap<String, String>();
			search_keyword.put("startDate", startDate);
			search_keyword.put("endDate", endDate);
			return e_p006Service.serchUserLineChart(search_keyword);
		}
		
		// 지정일자 조회 가입자 현황 바 차트
		@Override
		@ResponseBody
		@RequestMapping(value = "/admin/serchUserBarChart.do", method = RequestMethod.GET)
		public JSONObject serchUserBarChart(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			Map<String, String> search_keyword = new HashMap<String, String>();
			search_keyword.put("startDate", startDate);
			search_keyword.put("endDate", endDate);
			return e_p006Service.serchUserBarChart(search_keyword);
		}
		
//0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
		
	//셀렉트 cs글 통계 조회
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/selectPieChart.do", method = RequestMethod.GET)
	public JSONObject selectPieChart(@RequestParam(value="key_word" ,defaultValue = "all")String key_word, @RequestParam(value="st",  required = false)String st, 
			@RequestParam(value="end", required = false) String end, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> select_keyword = new HashMap<String, String>();
		select_keyword.put("st", st);
		select_keyword.put("end", end);
		select_keyword.put("key_word", key_word);
		return e_p006Service.selectPieChart(select_keyword);	
	}

	// 매출 현황 셀렉트 조회
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/selectColumnChart.do", method = RequestMethod.GET)
	public JSONObject selectColumnChart(@RequestParam(value="key_word" ,defaultValue = "all")String key_word, @RequestParam(value="st",  required = false)String st,
			@RequestParam(value="end", required = false) String end, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> select_keyword = new HashMap<String, String>();
		select_keyword.put("st", st);
		select_keyword.put("end", end);
		select_keyword.put("key_word", key_word);
		return e_p006Service.selectColumnChart(select_keyword);	
	}

	//유저 통계 셀렉트 조회
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/selectUserLineChart.do", method = RequestMethod.GET)
	public JSONObject selectUserLineChart(@RequestParam(value="key_word" ,defaultValue = "all")String key_word, @RequestParam(value="st",  required = false)String st,
			@RequestParam(value="end", required = false)String end, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> select_keyword = new HashMap<String, String>();
		select_keyword.put("st", st);
		select_keyword.put("end", end);
		select_keyword.put("key_word", key_word);
		return e_p006Service.selectUserLineChart(select_keyword);	
	}

	//셀렉트 조회유저통계 바차트
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/selectUserBarChart.do", method = RequestMethod.GET)
	public JSONObject selectUserBarChart(@RequestParam(value="key_word" ,defaultValue = "all")String key_word, @RequestParam(value="st",  required = false)String st, 
			@RequestParam(value="end", required = false)String end, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> select_keyword = new HashMap<String, String>();
		select_keyword.put("st", st);
		select_keyword.put("end", end);
		select_keyword.put("key_word", key_word);
		return e_p006Service.selectUserBarChart(select_keyword);
	}

}
