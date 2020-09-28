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

	// 샘플
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/boardChart.do", method = RequestMethod.GET)
	public JSONObject boardChart() throws Exception {
		return e_p006Service.boardChart();	
	}

	//기간별 조회
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

	//셀렉트 cs글 통계 조회
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/selectPieChart.do", method = RequestMethod.GET)
	public JSONObject selectPieChart(@RequestParam("key_word")String key_word, @RequestParam("st")String st,@RequestParam("end") String end, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, String> select_keyword = new HashMap<String, String>();
		select_keyword.put("st", st);
		select_keyword.put("end", end);
		select_keyword.put("key_word", key_word);
		return e_p006Service.selectPieChart(select_keyword);	
	}

	//매출 현황 지정일자 조회 그래프columnChart
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/searchDateColumnChart.do", method = RequestMethod.GET)
	public JSONObject searchDateColumnChart(String startDate, String endDate, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, String> search_keyword = new HashMap<String, String>();
		search_keyword.put("startDate", startDate);
		search_keyword.put("endDate", endDate);
		return e_p006Service.searchDateColumnChart(search_keyword);
	}


	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/selectColumnChart.do", method = RequestMethod.GET)
	public JSONObject selectColumnChart(@RequestParam("key_word")String key_word, @RequestParam("st")String st,@RequestParam("end") String end, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, String> select_keyword = new HashMap<String, String>();
		select_keyword.put("st", st);
		select_keyword.put("end", end);
		select_keyword.put("key_word", key_word);
		return e_p006Service.selectColumnChart(select_keyword);	
	}

}
