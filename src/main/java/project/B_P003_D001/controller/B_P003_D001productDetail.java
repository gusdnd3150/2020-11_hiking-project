package project.B_P003_D001.controller;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import project.*;
public interface B_P003_D001productDetail {
	public ModelAndView prodDetail(@RequestParam Map<String, Object> info,HttpServletRequest request,HttpServletResponse response);
	public ModelAndView payProduct(@PathVariable("prodNum") int prodNum,HttpServletRequest request,HttpServletResponse response);
	public ResponseEntity addAfter(@RequestParam Map<String,Object> info, MultipartHttpServletRequest file,HttpServletRequest request,HttpServletResponse response)throws Exception;
	public ResponseEntity addComent(@RequestParam Map<String,Object> info,HttpServletRequest request,HttpServletResponse response)throws Exception;
	public ResponseEntity<byte[]> getAfterImage(@PathVariable("num") int num, HttpServletRequest req, HttpServletResponse res)throws Exception;
	
}
