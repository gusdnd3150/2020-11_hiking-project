package project.admin.e_p001.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import project.admin.e_p001.vo.E_p001VO;

public interface E_p001Controller {
	
	public ModelAndView addUser(E_p001VO e_p001VO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchUser(String searchOption, String key_word,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public int removeUser(String userId,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView upDateUser(E_p001VO e_p001VO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView upDateUserList(String userId,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
