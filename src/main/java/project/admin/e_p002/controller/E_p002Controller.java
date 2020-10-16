package project.admin.e_p002.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public interface E_p002Controller {
	
	public ModelAndView insertProd( Map map,List<MultipartFile> files,List<MultipartFile> files2,List<Integer> quantity,List<String> color,List<String> prodSize, HttpServletRequest request) throws Exception ;
	//public String selectProd(String searchOption,String key_word , HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView selectProd(String searchOption,String key_word , HttpServletRequest request, HttpServletResponse response)throws Exception;
	public String deleteProd (int prodNum,  HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewProdList( int prodNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String updateOption (Map map, String prodStatus, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

