package project.admin.e_p002.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import project.admin.e_p002.service.E_p002Service;
import project.admin.e_p002.vo.E_p002VO;


@Controller
public class E_p002ControllerImpl implements E_p002Controller{
	private static final Logger logger = LoggerFactory.getLogger(E_p002ControllerImpl.class);

	private static final int String = 0;
	
	@Autowired
	private E_p002Service e_p002Service;

	//상품 등록 + 사진 등록
	@Override
	@RequestMapping(value = "/admin/insertProd.do", method = RequestMethod.POST)
	public ModelAndView insertProd(@RequestParam Map map,  
			@RequestParam(value = "file", required = false) List<MultipartFile> files, 
			@RequestParam(value = "file2", required = false)List<MultipartFile> files2,
			@RequestParam(value = "quantity[]", required = false) List<Integer> quantity, 
			@RequestParam(value = "color[]", required = false) List<String> color, 
			@RequestParam(value = "prodSize[]", required = false)List<String> prodSize, HttpServletRequest request)
			throws Exception {
		
		
		e_p002Service.insertProd(map);
		
		//상품등록 카테고리
		Map<String, Object> categoryMap = new HashMap<String, Object>();
		categoryMap.put("categoryNum", map.get("prodcategory3"));
		categoryMap.put("name", map.get("name"));
		e_p002Service.insertcategory(categoryMap);
		
		int index = (int) map.get("prodNum"); 
		
		//상품 메인,디테일 사진 등록
		String path = request.getSession().getServletContext().getRealPath("/");
		int insertProdPhoto = e_p002Service.insertProdPhoto(index, files, path);
		int insertPhotoDetail = e_p002Service.insertPhotoDetail(index, files2, path, insertProdPhoto);
		
		//상품 옵션 등록
		List<Map<String, Object>> optionListMap = new ArrayList<Map<String,Object>>();
		for (int i=0; i<quantity.size(); i++) {
			Map<String, Object> optionMap = new HashMap<String, Object>();
			optionMap.put("prodNum", index);
			optionMap.put("prodStatus", map.get("prodStatus"));
			optionMap.put("quantity", quantity.get(i));
			optionMap.put("color", color.get(i));
			optionMap.put("prodSize", prodSize.get(i));
			optionListMap.add(optionMap);
		}
		int insertProdOption = e_p002Service.insertProdOption(optionListMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p002_main");
		if (insertProdOption !=0) {
			mav.addObject("msg", "ok");
		}else {
			mav.addObject("msg", "x");
		}
		return mav;
	}


	//상품 조회
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/selectProd.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String selectProd(@RequestParam(value="searchOption") String searchOption, @RequestParam(defaultValue = " ") String key_word,  HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word",key_word);
		search.put("searchOption",searchOption);
		
		List<HashMap<String, String>> list = e_p002Service.selectProd(search);
	    String  serchList = new Gson().toJson(list);
	      
	    return serchList;
	}


	//삭제
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/deleteProd.do", method = RequestMethod.GET)
	public String deleteProd(@RequestParam(value="prodNum") int prodNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = e_p002Service.deleteProd(prodNum);
		if(result == 1) {
			return "ok";
		}
		return "x";
	}

	//상세보기
	@Override
	@RequestMapping(value = "/admin/viewProdList.do", method = RequestMethod.GET)
	public ModelAndView viewProdList(@RequestParam("prodNum")int prodNum, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		List viewDetaList = e_p002Service.viewProdList(prodNum);
		List<E_p002VO> viewPhotoList = e_p002Service.viewPhotoList(prodNum);
		
		System.out.println("viewPhotoList 사이즈"+viewPhotoList.size());
		System.out.println("viewDetaList 사이즈"+viewPhotoList.size());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p002_viewDateList");
		mav.addObject("viewDetaList",viewDetaList);
		mav.addObject("viewPhotoList",viewPhotoList);
		return mav;
	}


}
