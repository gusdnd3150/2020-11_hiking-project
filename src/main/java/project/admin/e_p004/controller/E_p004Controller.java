package project.admin.e_p004.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface E_p004Controller {
	
	public ModelAndView selectOrder(String searchOption, String key_word, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String updateDelivery(Map map, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectOrderDay(String key_word, String startDate, String endDate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchOrderDay(String startDate,String endDate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectOrderStatus(int orderStatus, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectDeliveryStatus(int deliverystatus, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewCancelList(String orderNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String message(Map map, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String cancelMessage(Map map, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String upDateCancel(List ordernum ,List quantity, List optionnum ,HttpServletRequest request, HttpServletResponse response) throws Exception;

}
