package project.admin.e_p005.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface E_p005Controller {
	
	public ModelAndView searchPayList( String key_word, String startDate, String endDate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectSearch(String key_word, String st, String end, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String toDaySales(Map map, HttpServletRequest request, HttpServletResponse response) throws Exception;
	

}
