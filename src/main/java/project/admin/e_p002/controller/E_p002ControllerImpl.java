package project.admin.e_p002.controller;

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


@Controller
public class E_p002ControllerImpl implements E_p002Controller{
	private static final Logger logger = LoggerFactory.getLogger(E_p002ControllerImpl.class);
	
	@Autowired
	private E_p002Service e_p002Service;

	//상품 등록 + 사진 등록
	@Override
	@RequestMapping(value = "/admin/insertProd.do", method = RequestMethod.POST)
	public ModelAndView insertProd(@RequestParam Map map,
            @RequestParam(value = "file", required = false) List<MultipartFile> files, HttpServletRequest request) throws Exception {
		
		e_p002Service.insertProd(map);
		int index = (int) map.get("prodNum");
        String path = request.getSession().getServletContext().getRealPath("/");
        int insertProdPhoto = e_p002Service.insertProdPhoto(index, files, path);
        ModelAndView mav = new ModelAndView();
		
        if(insertProdPhoto == 1) {
        	mav.setViewName("e_p002_main");
    		mav.addObject("msg", "ok");
        }else {
        	mav.setViewName("e_p002_main");
    		mav.addObject("msg", "x");
        }

		return mav;
	}


	//상품 조회
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/selectProd.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String selectProd(@RequestParam(value="searchOption") String searchOption, @RequestParam(defaultValue = " ") String key_word,  HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("서치 옵션:" + searchOption);
		System.out.println("키워드내용:" + key_word);
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word",key_word);
		search.put("searchOption",searchOption);
		
		List<HashMap<String, String>> list = e_p002Service.selectProd(search);
	    String  serchList = new Gson().toJson(list);
	   
	    System.out.println(serchList);
	      
	    return serchList;
	}


	//삭제
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/deleteProd.do", method = RequestMethod.GET)
	public String deleteProd(@RequestParam(value="prodNum") int prodNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("상품 삭제 번호 :"+prodNum);
		int result = e_p002Service.deleteProd(prodNum);
		if(result == 1) {
			return "ok";
		}
		return "x";
	}

}
