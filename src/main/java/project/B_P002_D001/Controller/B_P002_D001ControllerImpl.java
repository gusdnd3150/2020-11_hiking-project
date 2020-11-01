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
import project.user.service.UserService;


@Controller
public class B_P002_D001ControllerImpl  implements B_P002_D001Controller{
	private static final Logger logger = LoggerFactory.getLogger(B_P002_D001ControllerImpl.class);
	private static final String LOGIN = "LOGIN";
	
	@Autowired
	private B_P002_D001ShopingMallService b_P002_D001ShopingMallService;

	
	@Autowired
	UserService userService;
	               //상품 카테고리별 페이징
	@Override
	@RequestMapping(value = "/shopMainCate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView shopmainCate(@RequestParam Map<String, Object> info,HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("메인페이지 파라미터정보:"+info.toString());
		
		
		String nowPage = (String) info.get("nowPage");
		String cntPerPage = (String) info.get("cntPerPage");
		String listType = (String) info.get("listType");
		String searchContent= (String) info.get("searchContent");
		String sorting = (String) info.get("sorting");

		if(httpSession.getAttribute(LOGIN)!=null) { //로그인을 했을 경우
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			info.put("userNum", userNum);
		}else {
			info.put("userNum", 0);
		}
	
		if (nowPage == null && cntPerPage == null ) {
			nowPage = "1";
			cntPerPage = "9";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "9";
		}
		
	    
		
		if(listType==null) {
			listType ="100";
		}else if (sorting==null) {
			sorting="defualt";
		}
		
	    System.out.println(info.toString());
	    info.put("listType", Integer.parseInt(listType));
	    
		int total = b_P002_D001ShopingMallService.totalCount2(info);
		
		Paging vo2 = new Paging(Integer.parseInt(listType), total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),
				searchContent,sorting);
		
		info.put("listType", vo2.getListType());
		info.put("start", vo2.getStart());
		info.put("end", vo2.getEnd());
		info.put("searchContent", vo2.getSearchContent());
		info.put("sorting", vo2.getSorting());
		
		List<Map> list =b_P002_D001ShopingMallService.shopListTextCate(info);  // 
		
		System.out.println("페이징"+vo2.toString());
		mav.addObject("paging",vo2);
		mav.addObject("viewAll", list);
		
		List<Map> lastItems = b_P002_D001ShopingMallService.lastItems(info);     //최신 글 8개
		mav.addObject("lastItems", lastItems);
		mav.setViewName("/shoppingMall/shopMain");
		
		return mav;
	}
	

	
	/*             메인화면 백업
    //상품 카테고리별 페이징
@Override
@RequestMapping(value = "/B_P002_D001/shopMainCate", method = { RequestMethod.GET, RequestMethod.POST })
public ModelAndView shopmainCate(@RequestParam Map<String, Object> info,HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) throws Exception {
ModelAndView mav = new ModelAndView();
System.out.println("메인페이지 파라미터정보:"+info.toString());

Map<String,Object> search = new HashMap<String,Object>(); //해쉬맵으로 처리할거다 

String nowPage = (String) info.get("nowPage");
String cntPerPage = (String) info.get("cntPerPage");
String listType = (String) info.get("listType");


if(httpSession.getAttribute(LOGIN)!=null) { //로그인을 했을 경우
	String id = (String) httpSession.getAttribute(LOGIN); //아이디
	int userNum = userService.selectUserNum(id);         //유저넘
	search.put("userNum", userNum);
	info.put("userNum", userNum);
}else {
	search.put("userNum", 0);
	info.put("userNum", 0);
}

if (nowPage == null && cntPerPage == null ) {
	nowPage = "1";
	cntPerPage = "9";
} else if (nowPage == null) {
	nowPage = "1";
} else if (cntPerPage == null) { 
	cntPerPage = "9";
}

if(listType==null) {
	listType ="100";
}


if(listType.equals("200")) { //검색     
	System.out.println(info.toString());
	//int searchvalue= Integer.parseInt((String) info.get("search"));     //검색 조건 (전체검색,의류,등산 등등)
	//String searchType= (String)info.get("searchType");  //   검색타입 (이름/내용)
	String searchContent=(String)info.get("searchContent");  // 검색어
	//info.put("search", searchvalue);
	//info.put("searchType", searchType);
	info.put("searchContent", searchContent);
	
	   int total = b_P002_D001ShopingMallService.SearchTotalCount(info);
		Paging vo2 = new Paging(Integer.parseInt(listType),total, Integer.parseInt(nowPage), 
				Integer.parseInt(cntPerPage),searchContent);
		info.put("listType", vo2.getListType());
		info.put("start", vo2.getStart());
		info.put("end", vo2.getEnd());
		List<Map> list = b_P002_D001ShopingMallService.searchResult(info); //검색 처리 후
		
		mav.addObject("searchContent",searchContent); //검색어
		mav.addObject("paging",vo2);
		mav.addObject("viewAll", list);
		
}
else {  //일반 분류
	
search.put("listType", Integer.parseInt(listType));
int total = b_P002_D001ShopingMallService.totalCount2(search);
Paging vo2 = new Paging(Integer.parseInt(listType), total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
search.put("listType", vo2.getListType());
search.put("start", vo2.getStart());
search.put("end", vo2.getEnd());
List<Map> list =b_P002_D001ShopingMallService.shopListTextCate(search);  // 

System.out.println("ddd"+list.toString());

mav.addObject("paging",vo2);
mav.addObject("viewAll", list);
}


List<Map> lastItems = b_P002_D001ShopingMallService.lastItems();     //최신 글 5개
mav.addObject("lastItems", lastItems);
mav.setViewName("/shoppingMall/shopMain");

return mav;
}*/
	
	
	
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