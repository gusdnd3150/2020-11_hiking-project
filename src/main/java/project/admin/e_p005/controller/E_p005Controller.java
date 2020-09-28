package project.admin.e_p005.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface E_p005Controller {
	
	public ModelAndView searchPayList( String startDate, String endDate, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
