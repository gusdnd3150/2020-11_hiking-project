package project.admin.e_p004.controller;

import java.util.ArrayList;
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
public class E_p004ControllerImpl implements E_p004Controller {

	private static final Logger logger = LoggerFactory.getLogger(E_p004ControllerImpl.class);

	@Autowired
	private E_p004Service e_p004Service;

	// 주문조건검색
	@Override
	@RequestMapping(value = "/admin/selectOrder.do", method = RequestMethod.GET)
	public ModelAndView selectOrder(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam( defaultValue = "null") String key_word, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		try {
			Map<String, String> search = new HashMap<String, String>();
			search.put("key_word", key_word);
			search.put("searchOption", searchOption);
			List list = e_p004Service.selectOrder(search);
			List list2 = e_p004Service.selectCancelOrder();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("e_p004_main");
			mav.addObject("cancelOrde", list2);
			mav.addObject("list", list);
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("e_p004_main");
			return mav;
			
		}
		
	}

	// 배송 상태 변경
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/updateDelivery.do", method = RequestMethod.GET)
	public String updateDelivery(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		int result = e_p004Service.updateDelivery(map);
		if (result != 0) {
			return "ok";
		} else {
			return "x";
		}

	}

	// 셀렉트 일자 조회 (전체, 당일, 1주, 2주 1달)
	@Override
	@RequestMapping(value = "/admin/selectOrderDay.do", method = RequestMethod.GET)
	public ModelAndView selectOrderDay(@RequestParam("key_word") String key_word,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Map<String, String> select_keyword = new HashMap<String, String>();

		select_keyword.put("startDate", startDate);
		select_keyword.put("endDate", endDate);
		select_keyword.put("key_word", key_word);

		List list = e_p004Service.selectOrderDay(select_keyword);
		List list2 = e_p004Service.selectCancelOrder();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("cancelOrde", list2);
		mav.addObject("list", list);

		return mav;
	}

	// 지정일자 조회 (ex 2020-02-16 ~ 2020-10-11)
	@Override
	@RequestMapping(value = "/admin/searchOrderDay.do", method = RequestMethod.GET)
	public ModelAndView searchOrderDay(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Map<String, String> search_keyword = new HashMap<String, String>();
		search_keyword.put("startDate", startDate);
		search_keyword.put("endDate", endDate);

		List list = e_p004Service.searchOrderDay(search_keyword);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("list", list);

		return mav;
	}

	// 주문상태별 조회
	@Override
	@RequestMapping(value = "/admin/selectOrderStatus.do", method = RequestMethod.GET)
	public ModelAndView selectOrderStatus(@RequestParam("orderStatus") int orderStatus, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List list = e_p004Service.selectOrderStatus(orderStatus);
		List list2 = e_p004Service.selectCancelOrder();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("cancelOrde", list2);
		mav.addObject("list", list);

		return mav;
	}

	// 배송상태별 조회
	@Override
	@RequestMapping(value = "/admin/selectDeliveryStatus.do", method = RequestMethod.GET)
	public ModelAndView selectDeliveryStatus(@RequestParam("deliverystatus") int deliverystatus,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		List list = e_p004Service.selectDeliveryStatus(deliverystatus);
		List list2 = e_p004Service.selectCancelOrder();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("list", list);
		mav.addObject("cancelOrde", list2);
		return mav;
	}

	// 배송완료시 문자 발송
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/message.do", method = RequestMethod.GET)
	public String message(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		int result = e_p004Service.message(map);
		if (result != 0) {
			return "ok";
		} else {
			return "x";
		}
	}

	// 취소 상세페이지
	@Override
	@RequestMapping(value = "/admin/viewCancelList.do", method = RequestMethod.GET)
	public ModelAndView viewCancelList(@RequestParam(value = "merchant_uid") String merchant_uid,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		List list = e_p004Service.viewCancelList(merchant_uid);
		List list2 = e_p004Service.viewCancelList2(merchant_uid);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_cancelOrderList");
		mav.addObject("list", list);
		mav.addObject("list2", list2);
		return mav;
	}

	// 결제취소후 상품수량 업데이트
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/upDateCancel.do", method = RequestMethod.POST)
	public String upDateCancel(@RequestParam(value = "orderNum", required = false) List orderNum,
			@RequestParam(value = "quantity", required = false) List quantity,
			@RequestParam(value = "optionnum", required = false) List optionnum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<Map<String, Object>> ordernumListMap = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < quantity.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("orderNum", orderNum.get(i));
			ordernumListMap.add(map);

		}
		int num = e_p004Service.upDateOrderStatus(ordernumListMap);

		List<Map<String, Object>> optionListMap = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < quantity.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("quantity", quantity.get(i));
			map.put("optionnum", optionnum.get(i));
			optionListMap.add(map);

		}
		int result = e_p004Service.upDateCancel(optionListMap);
		if (result != 0) {

			return "ok";
		} else {
			return "x";
		}

	}

	// 결제 취소 문자
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/cancelMessage.do", method = RequestMethod.POST)
	public String cancelMessage(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		int result = e_p004Service.cancelMessage(map);
		if (result != 0) {
			return "ok";
		} else {
			return "x";
		}

	}

	// 금일 취소요청건 카운트
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/toDayCancelOrder.do", method = RequestMethod.POST)
	public String toDayCancelOrder(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return e_p004Service.toDayCancelOrder(map);
	}

	
	//취소 요청건 조회
	@Override
	@RequestMapping(value = "/admin/selectCancelOrderList.do", method = RequestMethod.GET)
	public ModelAndView selectCancelOrder( HttpServletRequest request, HttpServletResponse response) throws Exception {
		List list = e_p004Service.selectCancelOrder();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p004_main");
		mav.addObject("cancelOrde", list);

		return mav;
	}


}
