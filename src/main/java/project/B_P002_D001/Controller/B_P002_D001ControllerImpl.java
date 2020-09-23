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
	

	@Override          //메인 쇼핑몰 페이지
	@RequestMapping(value = "/B_P002_D001/shopMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView shopmain(HttpServletRequest request, HttpServletResponse response)throws Exception {
		ModelAndView mav = new ModelAndView();
		Paging vo =null;
		
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		//List<E_P002_D003PhotoVO> list =b_P002_D001ShopingMallService.shopListImage(); 이미지 보류
		
		int total = b_P002_D001ShopingMallService.totalCount();		
		System.out.println("토탈 상품"+total);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<E_P002_D003ProductsVO> list =b_P002_D001ShopingMallService.shopListText2(vo);  // 글만가져옴
		/*List<String> encodinglist = new ArrayList<String>();     //인코딩 완료된 이미지를 받기 위함
		try {
			List<E_P002_D003PhotoVO> Imagelist =b_P002_D001ShopingMallService.shopListImage(vo);
			System.out.println(list.size());
			for(int i=0;i<list.size();i++) {
				byte[] encoded = Base64.getEncoder().encode(Imagelist.get(i).getCONTENTImage());
				String encodedString = new String(encoded);		
				encodinglist.add(encodedString);
			}
		} catch (Exception e) {
			e.getStackTrace();
		}*/
		mav.addObject("paging",vo);
		mav.addObject("viewAll", list);
		mav.setViewName("/shopMain");
		return mav;
	}
	
	@Override  	//상품에대한 이미지
	@RequestMapping(value = "/B_P002_D001/mainImage/{num}")
	public ResponseEntity<byte[]> getByteImage(@PathVariable("num") int num,
		HttpServletRequest req, HttpServletResponse res)throws Exception {
		
		E_P002_D003PhotoVO vo = new E_P002_D003PhotoVO();
		vo.setPRODNUM(num);
		vo = b_P002_D001ShopingMallService.getImage(vo);
		byte[] imageContent = (byte[])vo.getCONTENTImage();  //가져온 데이터를 바이트로 뿌린다
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
		}
	

	

	/*
	@Override        //다중 이미지 다운로드  공부용ㄴ
	@RequestMapping(value = "/B_P002_D001/mainprodList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getimageList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("여기까지 넘어옴");

		List<String> encodinglist = new ArrayList<String>();     //다중이미지 출력
		try {
			//List<E_P002_D003PhotoVO> list =b_P002_D001ShopingMallService.getImage();
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