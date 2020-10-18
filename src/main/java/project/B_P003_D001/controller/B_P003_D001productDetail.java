package project.B_P003_D001.controller;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public ResponseEntity addAfter(@RequestParam Map<String,Object> info,HttpSession httpSession, MultipartHttpServletRequest file,HttpServletRequest request,HttpServletResponse response)throws Exception;
	public ResponseEntity addComent(@RequestParam Map<String,Object> info,HttpSession httpSession,HttpServletRequest request,HttpServletResponse response)throws Exception;
	public ResponseEntity<byte[]> getAfterImage(@PathVariable("num") int num, HttpServletRequest req, HttpServletResponse res)throws Exception;
	public ModelAndView buyProduct(@RequestParam Map<String,Object> info,
			HttpSession httpSession, HttpServletRequest req, HttpServletResponse res)throws Exception;
	public void buyProductFromDetail(@RequestParam Map<String,Object> info,
			@RequestParam(value = "prodNums[]") List<Integer> prodNums,
			@RequestParam(value = "optionnums[]") List<Integer> optionnums,
			@RequestParam(value = "quantities[]") List<Integer> quantities,
			@RequestParam(value = "prices[]") List<Integer> prices,
			@RequestParam(value = "optionNums[]") List<Integer> optionNums,
			@RequestParam(value = "prodSizes[]") List<String> prodSizes,
			@RequestParam(value = "prodColors[]") List<String> prodColors,
			@RequestParam(value = "prodNames[]") List<String> prodNames,
			@RequestParam(value = "prodImages[]") List<String> prodImages,
			HttpSession httpSession, HttpServletRequest req, HttpServletResponse res)throws Exception;
	
	public ResponseEntity addCart(@RequestParam Map<String,Object> info, 
			@RequestParam(value = "prodNums[]")List<Integer> prodNums,
			@RequestParam(value = "prices[]")List<Integer> prices,
			@RequestParam(value = "optionnums[]")List<Integer> optionnums,
			@RequestParam(value = "quantities[]")List<Integer> quantities,
			HttpServletRequest req, HttpServletResponse res,HttpSession httpSession) throws Exception;
	public ResponseEntity addCartMain(@RequestParam Map<String,Object> info)throws Exception;
	public String checkCart(@RequestParam Map<String,Object> info, HttpServletRequest req, HttpServletResponse res) throws Exception;
	public String insertPayinfo(@RequestParam Map<String, Object> info,HttpSession httpSession,
			@RequestParam(value = "prodNums[]") List<Integer> prodNums,
			@RequestParam(value = "quantityToDB[]") List<Integer> quantityToDB,  
			@RequestParam(value = "orderNums[]") List<Integer> orderNums,
			@RequestParam(value = "perTotals[]") List<Integer> perTotals,
			@RequestParam(value = "prodPrices[]") List<Integer> prodPrices,
			@RequestParam(value = "optionNums[]") List<Integer> optionNums,
			HttpServletRequest requst,HttpServletResponse response);
	public Map<String,Object> getSession(HttpServletRequest req, HttpServletResponse res,HttpSession httpSession)throws Exception;
	public ModelAndView cartList(@RequestParam Map<String, Object> info,HttpSession httpSession, HttpServletRequest req, HttpServletResponse res)throws Exception;
	public void deleteCart(@RequestParam Map<String,Object> info, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	public String buyProductsFromCart(
			@RequestParam(value = "totalPrice[]") List<Integer> totalPrice,
			@RequestParam(value = "orderNums[]")List<Integer> orderNums,
			@RequestParam(value = "quantities[]")List<Integer> quantities,
			@RequestParam(value = "optionNums[]")List<Integer> optionNums,
			@RequestParam(value = "images[]")List<String> images,
			@RequestParam(value = "prodNames[]")List<String> prodNames,
			@RequestParam(value = "colors[]")List<String> colors,
			@RequestParam(value = "sizes[]")List<String> sizes,
			@RequestParam(value = "prices[]")List<Integer> prices,
			@RequestParam(value = "prodNums[]")List<Integer> prodNums,
			HttpServletRequest req, HttpServletResponse res)
			throws Exception ;
	
	public ModelAndView addUsedProduct(MultipartHttpServletRequest upfile,
			HttpSession httpSession,
			@RequestParam Map<String,Object> info,
			@RequestParam(value = "quantity[]")List<Integer> quantity,
			@RequestParam(value = "prodSize[]")List<String> prodSize,
			@RequestParam(value = "prodstatus[]")List<Integer> prodstatus,
			@RequestParam(value = "color[]")List<String> color,
			HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView addForm( HttpServletResponse response,HttpServletRequest request) throws Exception ;
	
	public List<Map> chooseOption(@RequestParam Map<String,Object> info,HttpServletResponse response,HttpServletRequest request)throws Exception;
	public String modOption(@RequestParam Map<String,Object> info,HttpServletResponse response,HttpServletRequest request)throws Exception;

}
