package project.admin.e_p002.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public interface E_p002Controller {
	
	public ModelAndView insertProd( Map map,List<MultipartFile> files, HttpServletRequest request) throws Exception ;
	public String selectProd(String searchOption,String key_word , HttpServletRequest request, HttpServletResponse response)throws Exception;
	public String deleteProd (int prodNum,  HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}

