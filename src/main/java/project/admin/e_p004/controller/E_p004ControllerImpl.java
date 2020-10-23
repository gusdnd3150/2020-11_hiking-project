package project.admin.e_p004.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.admin.e_p004.service.E_p004Service;



@Controller
public class E_p004ControllerImpl implements E_p004Controller{
	
	private static final Logger logger = LoggerFactory.getLogger(E_p004ControllerImpl.class);
	
	@Autowired
	private E_p004Service e_p004Service; 

	//주문조건검색
	@Override
	@RequestMapping(value = "/admin/selectOrder.do", method = RequestMethod.GET)
	public ModelAndView selectOrder(@RequestParam(defaultValue="all") String searchOption, @RequestParam(required=false) String key_word, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word", key_word);
		search.put("searchOption", searchOption);
		List list = e_p004Service.selectOrder(search);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("list", list);
		return mav;
	}

	//배송 상태 변경
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/updateDelivery.do", method = RequestMethod.GET)
	public String updateDelivery(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int result = e_p004Service.updateDelivery(map);
		if(result !=0) {
			return "ok";
		}else {
			return "x";
		}
		
	}

	//셀렉트 일자 조회 (전체, 당일, 1주, 2주 1달)
	@Override
	@RequestMapping(value = "/admin/selectOrderDay.do", method = RequestMethod.GET)
	public ModelAndView selectOrderDay(@RequestParam("key_word")String key_word,  @RequestParam(value="startDate",  required = false)String startDate,
			@RequestParam(value="endDate", required = false)String endDate, HttpServletRequest request, HttpServletResponse response) throws Exception  {
	
		Map<String, String> select_keyword = new HashMap<String, String>();
				
		select_keyword.put("startDate", startDate);
		select_keyword.put("endDate", endDate);
		select_keyword.put("key_word", key_word);
			
		List list = e_p004Service.selectOrderDay(select_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("list", list);
				
		return mav;
	}

	//지정일자 조회 (ex 2020-02-16 ~ 2020-10-11)
	@Override
	@RequestMapping(value = "/admin/searchOrderDay.do", method = RequestMethod.GET)
	public ModelAndView searchOrderDay(@RequestParam("startDate")String startDate, @RequestParam("endDate")String endDate, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		Map<String, String> search_keyword = new HashMap<String, String>();
		search_keyword.put("startDate", startDate);
		search_keyword.put("endDate", endDate);
		
		List list = e_p004Service.searchOrderDay(search_keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("list", list);
				
		return mav;
	}

	//주문상태별 조회
	@Override
	@RequestMapping(value = "/admin/selectOrderStatus.do", method = RequestMethod.GET)
	public ModelAndView selectOrderStatus(@RequestParam("orderStatus") int orderStatus, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List list = e_p004Service.selectOrderStatus(orderStatus);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("list", list);
				
		return mav;
	}

	//배송상태별 조회
	@Override
	@RequestMapping(value = "/admin/selectDeliveryStatus.do", method = RequestMethod.GET)
	public ModelAndView selectDeliveryStatus(@RequestParam("deliverystatus") int deliverystatus, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List list = e_p004Service.selectDeliveryStatus(deliverystatus);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("list", list);
		return mav;
	}

	//배송완료시 문자 발송
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/message.do", method = RequestMethod.GET)
	public String message(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("map      뮨자"+map.get("phone"));
		System.out.println("map      뮨자"+map.get("name"));
		int result = e_p004Service.message(map);
		if(result !=0) {
			return "ok";
		}else {
			return "x";
		}
	}

}
