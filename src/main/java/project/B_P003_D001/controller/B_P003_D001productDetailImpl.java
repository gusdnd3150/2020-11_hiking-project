package project.B_P003_D001.controller;

import java.util.ArrayList;

import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import project.B_P002_D001.Controller.B_P002_D001ControllerImpl;
import project.B_P002_D001.Service.B_P002_D001ShopingMallService;
import project.B_P003_D001.service.B_P003_D001productService;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;


@Controller
public class B_P003_D001productDetailImpl implements B_P003_D001productDetail {
	private static final Logger logger = LoggerFactory.getLogger(B_P002_D001ControllerImpl.class);
	
	@Autowired
	B_P003_D001productService b_P003_D001productService;
	
	@Override         //상품 상세페이지
	@RequestMapping(value = "/B_P003_D001/productDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView prodDetail(@RequestParam Map<String, Object> info,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		E_P002_D003ProductsVO vo = new E_P002_D003ProductsVO();
		Map<String,Object> map = new HashMap<String,Object>();
		
		
		String prodNum = (String) info.get("prodNum");
		map.put("prodNum", Integer.parseInt(prodNum));
		
		vo = b_P003_D001productService.topDetail(map); //상단의 텍스트 내용
		List<String> images = new ArrayList<String>();     // 제품 상세 다중이미지 출력
		List<E_P002_D003PhotoVO> list = b_P003_D001productService.detailImages(map);  
			System.out.println("넘어온 개수"+list.size());                                  
			try {
			for(E_P002_D003PhotoVO item : list) {
				byte[] encoded = Base64.getEncoder().encode(item.getContent());        
				String encodedString = new String(encoded);		
				images.add(encodedString);
    			}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
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
			int total = b_P003_D001productService.afterTotal(map);
			System.out.println("total:"+total);
			Paging page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			map.put("start", page.getStart());
			map.put("end", page.getEnd());
			map.put("prodNum", prodNum);
			
	    List<productAfterVO> afterList = b_P003_D001productService.afterList(map); //후기 리스트
	    System.out.println("넘어온 "+afterList.size());
	    //이미지 출력은 메소드를 이용할것
	    
	    mav.addObject("images",images); //하단 제품설명 이미지
		mav.addObject("prodDetail",vo); // 상단 제품 텍스트
		mav.addObject("afterList",afterList); // 상품후기 리스트
		mav.addObject("paging",page); // 상품후기 페이징
		mav.setViewName("/shoppingMall/productDetail");
		return mav;
	}
	/*
	@Override         //상품 상세페이지
	@RequestMapping(value = "/B_P003_D001/productDetail/{prodNum}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView prodDetail(@PathVariable("prodNum") int prodNum,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		E_P002_D003ProductsVO vo = new E_P002_D003ProductsVO();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("prodNum", prodNum);
		vo = b_P003_D001productService.topDetail(map); //상단의 텍스트 내용
		List<String> images = new ArrayList<String>();     // 제품 상세 다중이미지 출력
		List<E_P002_D003PhotoVO> list = b_P003_D001productService.detailImages(map);  
			System.out.println("넘어온 개수"+list.size());                                  
			try {
			for(E_P002_D003PhotoVO item : list) {
				byte[] encoded = Base64.getEncoder().encode(item.getContent());        
				String encodedString = new String(encoded);		
				images.add(encodedString);
    			}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
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
			int total = b_P003_D001productService.afterTotal(map);
			System.out.println("total:"+total);
			Paging page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			map.put("start", page.getStart());
			map.put("end", page.getEnd());
			map.put("prodNum", prodNum);
			
	    List<productAfterVO> afterList = b_P003_D001productService.afterList(map); //후기 리스트
	    System.out.println("넘어온 "+afterList.size());
	    //이미지 출력은 메소드를 이용할것
	    
	    mav.addObject("images",images); //제품 상세
		mav.addObject("prodDetail",vo); // 상단의 제품 텍스트
		mav.addObject("afterList",afterList); // 상품후기 리스트
		mav.addObject("paging",page); // 상품후기 페이징
		mav.setViewName("/shoppingMall/productDetail");
		return mav;
	}*/


	@ResponseBody         //후기등록
	@RequestMapping(value = "/B_P003_D001/addAfter", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity addAfter(@RequestParam Map<String, Object> info ,MultipartHttpServletRequest upfile,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		//회원에 관한것은 없기때문에 임의로 진행하였다  
		MultipartFile file = upfile.getFile("photo");
		byte[] photo = file.getBytes();
		info.put("photo", photo);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			b_P003_D001productService.addAfter(info);
			RequestDispatcher dispatch = request.getRequestDispatcher("/B_P003_D001/productDetail?prodNum="+info.get("prodNum")+"");
			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/B_P003_D001/addAfter'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	
	@Override         // 댓글 등록
	@RequestMapping(value = "/B_P003_D001/addComent", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity addComent(@RequestParam Map<String, Object> info, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
        String afterType = (String) info.get("afterType");
        String prodNum = (String) info.get("prodNum");
        info.put("prodNum", Integer.parseInt(prodNum));
        info.put("afterType", Integer.parseInt(afterType));
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			b_P003_D001productService.addComent(info);
			RequestDispatcher dispatch = request.getRequestDispatcher("/B_P003_D001/productDetail?prodNum="+info.get("prodNum"));
			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/B_P003_D001/addAfter'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}



	@Override  	       //이미지 출력
	@RequestMapping(value = "/B_P003_D001/AfterImage/{num}")
	public ResponseEntity<byte[]> getAfterImage(@PathVariable("num") int num,
		HttpServletRequest req, HttpServletResponse res)throws Exception {
		productAfterVO vo = new productAfterVO();
		vo.setAfterNum(num);
		vo = b_P003_D001productService.getImage(vo);
		byte[] imageContent = (byte[])vo.getPhoto();  //가져온 데이터를 바이트로 뿌린다
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
		}
	
	
	
	@Override             // 결제
	@RequestMapping(value = "/B_P003_D001/pay/{prodNum}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView payProduct(@PathVariable("prodNum") int prodNum,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shoppingMall/pay");
		return mav;
	}
	
}
