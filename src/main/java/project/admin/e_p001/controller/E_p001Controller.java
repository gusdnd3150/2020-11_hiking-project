package project.admin.e_p001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import project.admin.e_p001.vo.E_p001VO;





public interface E_p001Controller {
	
	public ModelAndView searchUser(String searchOption, String key_word,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String upDateUser(Map map ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String updateUserPoint(Map map ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView userView(int userNum,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String toDayUser(Map map ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView toDayUserList(String st ,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
