package project.B_P002_D001.Controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.Paging;
import project.B_P002_D001.Service.B_P002_D001ShopingMallService;
import project.E_P002_D003.Service.E_P002_D003ProductsService;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;


@Controller
public class B_P002_D001ControllerImpl  implements B_P002_D001Controller{
	private static final Logger logger = LoggerFactory.getLogger(B_P002_D001ControllerImpl.class);
	//private static final String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	
	@Autowired
	private B_P002_D001ShopingMallService b_P002_D001ShopingMallService;

	
	
	               //상품 카테고리별 페이징
	@Override
	@RequestMapping(value = "/B_P002_D001/shopMainCate", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView shopmainCate(@RequestParam Map<String, Object> info,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("메인페이지 파라미터정보:"+info.toString());
		
		Map<String,Object> search = new HashMap<String,Object>(); //해쉬맵으로 처리할거다 
		
		String nowPage = (String) info.get("nowPage");
		String cntPerPage = (String) info.get("cntPerPage");
		String listType = (String) info.get("listType");
	
		if (nowPage == null && cntPerPage == null ) {
			nowPage = "1";
			cntPerPage = "9";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "9";
		}
		
		if(listType.equals("200")) { //검색      파라미터정보 (search=clime, searchContent=)
			System.out.println(info.toString());
			String searchvalue= (String) info.get("search");
			String searchType=(String) info.get("searchType");
			String searchContent=(String) info.get("searchContent");
			int total = b_P002_D001ShopingMallService.SearchTotalCount(info);
			Paging vo2 = new Paging(Integer.parseInt(listType),total, Integer.parseInt(nowPage), 
					Integer.parseInt(cntPerPage),searchvalue,searchType,searchContent);
			info.put("search", searchvalue);
			info.put("searchType", searchType);
			info.put("searchContent", searchContent);
			info.put("listType", vo2.getListType());
			info.put("start", vo2.getStart());
			info.put("end", vo2.getEnd());
			List<Map> list = b_P002_D001ShopingMallService.searchResult(info); //검색 처리 후 
			mav.addObject("paging",vo2);
			mav.addObject("viewAll", list);
			
		}else {  //일반 분류
		search.put("listType", Integer.parseInt(listType));
		int total = b_P002_D001ShopingMallService.totalCount2(search);
		Paging vo2 = new Paging(Integer.parseInt(listType),total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		search.put("listType", vo2.getListType());
		search.put("start", vo2.getStart());
		search.put("end", vo2.getEnd());
		List<Map> list =b_P002_D001ShopingMallService.shopListTextCate(search);  // 
		
		mav.addObject("paging",vo2);
		mav.addObject("viewAll", list);
		}
		
		
		
		List<Map> lastItems = b_P002_D001ShopingMallService.lastItems();     //최신 글 5개
		mav.addObject("lastItems", lastItems);
		mav.setViewName("/shoppingMall/shopMain");
		
		return mav;
	}
	

	/*
	@Override      //검색 이전버전  
	@RequestMapping(value = "/B_P002_D001/searchResult", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ㅊ(@RequestParam Map<String, Object> info, HttpServletRequest request, HttpServletResponse response)throws Exception {
		ModelAndView mav= new ModelAndView();
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		//System.out.println("타입"+info.get("searchtype"));
		//System.out.println("내용"+info.get("searchContent"));
		
		if(info.get("searchtype")==""&&info.get("searchtype")==null) {
			String searchtype = (String) request.getAttribute("searchtype");
			String searchContent = (String) request.getAttribute("searchContent");
			info.put("searchtype", searchtype);
			info.put("searchContent", searchContent);
			System.out.println("타입"+info.get("searchtype"));
			System.out.println("내용"+info.get("searchContent"));
			int total = b_P002_D001ShopingMallService.SearchTotalCount(info);
			System.out.println("총 개수"+total);
			Paging vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			int start = vo.getStart();
			int end = vo.getEnd();
			info.put("start",start );
			info.put("end", end);
			List<Map> list = b_P002_D001ShopingMallService.searchResult(info);
			System.out.println("넘어온 리스트"+list.size());
			mav.addObject("viewAll", list);
			mav.addObject("paging",vo);
		}else {
			int total = b_P002_D001ShopingMallService.SearchTotalCount(info);
			System.out.println("총 개수"+total);
			Paging vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			int start = vo.getStart();
			int end = vo.getEnd();
			info.put("start",start );
			info.put("end", end);
			List<Map> list = b_P002_D001ShopingMallService.searchResult(info);
			System.out.println("넘어온 리스트"+list.size());
			mav.addObject("viewAll", list);
			mav.addObject("paging",vo);
		}
		
		request.setAttribute("searchtype", info.get("searchtype"));
		request.setAttribute("searchContent", info.get("searchContent"));
		mav.setViewName("/shoppingMall/searchResult");
		return mav;
	}
      */
	
	
	
	/*
	@Override  	//상품에대한 이미지
	@RequestMapping(value = "/B_P002_D001/mainImage/{num}")
	public ResponseEntity<byte[]> getByteImage(@PathVariable("num") int num,
		HttpServletRequest req, HttpServletResponse res)throws Exception {
		E_P002_D003PhotoVO vo = new E_P002_D003PhotoVO();
		vo.setProdNum(num);
		vo = b_P002_D001ShopingMallService.getImage(vo);
		byte[] imageContent = (byte[])vo.getContent();  //가져온 데이터를 바이트로 뿌린다
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
		}*/
	
	
	/*
	@Override          //메인 쇼핑몰 페이지
	@RequestMapping(value = "/B_P002_D001/shopMain", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView shopmain(HttpServletRequest request, HttpServletResponse response)throws Exception {
		ModelAndView mav = new ModelAndView();
		Paging vo = new Paging();  
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		int total = b_P002_D001ShopingMallService.totalCount();		
		vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<E_P002_D003ProductsVO> list =b_P002_D001ShopingMallService.shopListText2(vo);  // 글만가져옴
		mav.addObject("paging",vo);
		mav.addObject("viewAll", list);
		mav.setViewName("/shoppingMall/main");
		return mav;
	}*/
	
	
	
	
/*
	@Override        //다중 이미지 다운로드  공부용
	@RequestMapping(value = "/B_P002_D001/mainprodList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getimageList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("여기까지 넘어옴");

		List<String> encodinglist = new ArrayList<String>();     //다중이미지 출력
		try {
			List<E_P002_D003PhotoVO> list =b_P002_D001ShopingMallService.getImage();
			System.out.println(list.size());
			for(int i=0;i<list.size();i++) {
				byte[] encoded = Base64.getEncoder().encode(list.get(i).getCONTENTImage());
				String encodedString = new String(encoded);		
				encodinglist.add(encodedString);
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		System.out.println("값 확인:"+ encodinglist.get(0).getBytes());
		
		mav.addObject("encodinglist",encodinglist);
		mav.setViewName("/product/result4");
		return mav;
	} */






}