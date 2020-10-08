package project.B_P003_D001.controller;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import project.*;
public interface B_P003_D001productDetail {
	public ModelAndView prodDetail(@RequestParam Map<String, Object> info,HttpServletRequest request,HttpServletResponse response);
	public ResponseEntity addAfter(@RequestParam Map<String,Object> info, MultipartHttpServletRequest file,HttpServletRequest request,HttpServletResponse response)throws Exception;
	public ResponseEntity addComent(@RequestParam Map<String,Object> info,HttpServletRequest request,HttpServletResponse response)throws Exception;
	public ResponseEntity<byte[]> getAfterImage(@PathVariable("num") int num, HttpServletRequest req, HttpServletResponse res)throws Exception;
	public ModelAndView buyProduct(@RequestParam Map<String,Object> info, HttpServletRequest req, HttpServletResponse res)throws Exception;
	public void addCart(@RequestParam Map<String,Object> info, HttpServletRequest req, HttpServletResponse res) throws Exception;
	public String checkCart(@RequestParam Map<String,Object> info, HttpServletRequest req, HttpServletResponse res) throws Exception;
	public String insertPayinfo(@RequestParam Map<String, Object> info,HttpServletRequest requst,HttpServletResponse response);
	public Map<String,Object> getSession(HttpServletRequest req, HttpServletResponse res)throws Exception;
	public ModelAndView cartList(@RequestParam Map<String, Object> info, HttpServletRequest req, HttpServletResponse res)throws Exception;
	public void deleteCart(@RequestParam Map<String,Object> info, HttpServletRequest req, HttpServletResponse res) throws Exception;
	public String buyProductsFromCart(@RequestParam(value = "totalPrice[]") List<Integer> totalPrice,
			@RequestParam(value = "orderNums[]")List<Integer> orderNums,@RequestParam(value = "quantities[]")List<Integer> quantities, HttpServletRequest req, HttpServletResponse res) throws Exception;
	public ModelAndView addUsedProduct(MultipartHttpServletRequest file,HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView addForm(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	

}
