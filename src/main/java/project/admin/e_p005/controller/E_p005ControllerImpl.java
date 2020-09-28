package project.admin.e_p005.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@Override
	@RequestMapping(value = "/admin/searchPayList.do", method = RequestMethod.GET)
	public ModelAndView searchPayList(@RequestParam("startDate")String startDate, @RequestParam("endDate")String endDate, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		Map<String, String> search_keyword = new HashMap<String, String>();
		search_keyword.put("startDate", startDate);
		search_keyword.put("endDate", endDate);
		
		
		List payList = e_p005Service.searchPayList(search_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p005_main");
		mav.addObject("payList", payList);
		return mav;
	}
	
	

}
