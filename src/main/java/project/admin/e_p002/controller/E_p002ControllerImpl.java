package project.admin.e_p002.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import project.admin.e_p002.service.E_p002Service;


@Controller
public class E_p002ControllerImpl implements E_p002Controller{
	private static final Logger logger = LoggerFactory.getLogger(E_p002ControllerImpl.class);

	private static final int String = 0;
	
	@Autowired
	private E_p002Service e_p002Service;

	//상품 등록 + 사진 등록 + 카테고리 + 옵션
	@Override
	@RequestMapping(value = "/admin/insertProd.do", method = RequestMethod.POST)
	public ModelAndView insertProd(@RequestParam Map map,  
			@RequestParam(value = "file", required = false) List<MultipartFile> files, 
			@RequestParam(value = "file2", required = false)List<MultipartFile> files2,
			@RequestParam(value = "quantity[]", required = false) List<Integer> quantity, 
			@RequestParam(value = "color[]", required = false) List<String> color, 
			@RequestParam(value = "prodSize[]", required = false)List<String> prodSize, HttpServletRequest request)
			throws Exception {
		
		//상품등록
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
	
	//상품조회
	@Override
	@RequestMapping(value = "/admin/selectProd.do", method = RequestMethod.GET )
	public ModelAndView selectProd(@RequestParam(value="searchOption") String searchOption, @RequestParam(defaultValue = "null") String key_word, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word",key_word);
		search.put("searchOption",searchOption);
		
		List list = e_p002Service.selectProd(search);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p002_main");
		mav.addObject("list",list);
		
		return mav;
	}


	//상세보기
	@Override
	@RequestMapping(value = "/admin/viewProdList.do", method = RequestMethod.GET)
	public ModelAndView viewProdList(@RequestParam("optionNum")int optionNum,@RequestParam("prodNum") int prodNum, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		List viewDetaList = e_p002Service.viewProdList(optionNum);
		List viewList = e_p002Service.viewList(optionNum);
		List viewPhotoMainList = e_p002Service.viewPhotoMainList(prodNum);
		List viewPhotoDetail = e_p002Service.viewPhotoDetail(prodNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p002_viewDateList");
		mav.addObject("viewDetaList",viewDetaList);
		mav.addObject("viewPhotoMainList",viewPhotoMainList);
		mav.addObject("viewPhotoDetail",viewPhotoDetail);
		mav.addObject("viewList",viewList);
	
		return mav;
	}


	//상품 옵션 수정 (재고, 사이즈, 색상 변경 ) 데이터 테이블 안에서 사용
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/updateOption.do", method = RequestMethod.GET)
	public String updateOption(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {

		int result = e_p002Service.updateOption(map);
		
		if(result == 1) {
			return "ok";
		}
		return "x";
	
	}

	//상품 옵션 수정
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/updateDateProdOption.do", method = RequestMethod.GET)
	public String updateDateProdOption(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int result = e_p002Service.updateDateProdOption(map);
		
		if(result == 1) {
			return "ok";
		}
		return "x";
	
	}

	//상품 수정
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/updateDateProd.do", method = RequestMethod.GET)
	public String updateDateProd(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		int result = e_p002Service.updateDateProd(map);
		
		if(result == 1) {
			return "ok";
		}
		return "x";
	}

	//상품 메인사진 수정
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/upDateMainPhoto.do", method = RequestMethod.POST)
	public String upDateMainPhoto(MultipartHttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="prodNum")int prodNum,@RequestParam(value="pphotonum") int pphotonum)throws IOException {
		
		  Map<String, MultipartFile> fileMap = request.getFileMap();
		  String path = request.getSession().getServletContext().getRealPath("/");
	      int result = e_p002Service.upDateMainPhoto(prodNum, fileMap, path, pphotonum);
		
	      if(result != 0) {
			return "ok";
	      }
		return "x";
		
	}

	//상품 디테일 사진 수정
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/upDateDetailPhoto.do", method = RequestMethod.POST)
	public String upDateDetailPhoto(MultipartHttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="prodNum")int prodNum,@RequestParam(value="pphotonum") int pphotonum) throws IOException {
		
		  Map<String, MultipartFile> fileMap = request.getFileMap();
		  String path = request.getSession().getServletContext().getRealPath("/");
	      int result = e_p002Service.upDateDetailPhoto(prodNum, fileMap, path, pphotonum);
	      
	      if(result != 0) {
			return "ok";
	      }
		return "x";
	}

	//상세페이지 이미지 선택 삭제
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/deleteImg.do", method = RequestMethod.GET)
	public String deleteImg(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response)throws Exception {
	
		int result = e_p002Service.deleteImg(map);
		if(result == 1) {
			return "ok";
		}
		return "x";
	}

	//상세페이지 메인 이미지 추가
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/upDateAddMainImg.do", method = RequestMethod.POST)
	public String upDateAddMainImg(@RequestParam(value = "file", required = false)List<MultipartFile> files,@RequestParam(value="prodNum") int prodNum,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String path = request.getSession().getServletContext().getRealPath("/");
		int result = e_p002Service.upDateAddMainImg(files,path,prodNum);
		if(result != 0) {
			return "ok";
		}
		return "x";
	}

	//상세페이지 디테일 이미지 추가
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/upDateAddDetailImg.do", method = RequestMethod.POST)
	public String upDateAddDetailImg(@RequestParam(value = "file2", required = false)List<MultipartFile> files,@RequestParam(value="prodNum") int prodNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String path = request.getSession().getServletContext().getRealPath("/");
		int result = e_p002Service.upDateAddDetailImg(files,path,prodNum);
		if(result != 0) {
			return "ok";
		}
		return "x";
	}

	//중고 요청 상세보기
	@Override
	@RequestMapping(value = "/admin/viewUsedList.do", method = RequestMethod.GET)
	public ModelAndView viewUsedList(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {

		int prodNum = Integer.parseInt (map.get("prodNum").toString());
		//상품, 고객정보
		List list = e_p002Service.viewUsedList(map);
		//상품 옵션
		List list2 = e_p002Service.viewUsedOptionList(prodNum);
		//상품 메인
		List list3 = e_p002Service.viewPhotoMainList(prodNum);
		//상품 디테일
		List list4 = e_p002Service.viewPhotoDetail(prodNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p002_viewUsedList");
		mav.addObject("list", list);
		mav.addObject("list2", list2);
		mav.addObject("list3", list3);
		mav.addObject("list4", list4);
		
		
		return mav;
	}

	//중고거래 취소 (취소사유 등록 및 타입변환)
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/usedComment.do", method = RequestMethod.POST)
	public String usedComment(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int result = e_p002Service.usedComment(map);
		if(result != 0) {
			return "ok";
		}
		return "x";
		
	}

	//중고품 조건 검색 조회
	@Override
	@RequestMapping(value = "/admin/selectUsedProd.do", method = RequestMethod.GET)
	public ModelAndView selectUsedProd(@RequestParam(value="searchOption") String searchOption, @RequestParam(value="key_word", defaultValue = "null") String key_word,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("key_word",key_word);
		search.put("searchOption",searchOption);
		
		
		List list =e_p002Service.searchUsedProd(search);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("e_p002_main");
		mav.addObject("used",list);
		
		return mav;
	}

	//중고거래승인 포인트지급 및 문자발송
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/insertPoint.do", method = RequestMethod.POST)
	public String insertPoint(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		int result = e_p002Service.insertPoint(map);
		
		if(result != 0) {
			return "ok";
		}
		return "x";
	}

	//중고요청 카운트 알림
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/countUsed.do", method = RequestMethod.POST)
	public String countUsed(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return e_p002Service.countUsed();
	}

	//금일주문건 카운트
	@Override
	@ResponseBody
	@RequestMapping(value = "/admin/toDayOrder.do", method = RequestMethod.POST)
	public String todayOrder(@RequestParam Map map,HttpServletRequest request, HttpServletResponse response) throws Exception {
		return e_p002Service.todayOrder(map);
	}


}
