package project.B_P003_D001.controller;

import java.io.BufferedReader;

import java.io.File;


import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;


import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonIgnore;

import project.Paging;
import project.B_P002_D001.Controller.B_P002_D001ControllerImpl;
import project.B_P002_D001.Service.B_P002_D001ShopingMallService;
import project.B_P003_D001.service.B_P003_D001productService;
import project.B_P003_D001.vo.DeliveryVO;
import project.B_P003_D001.vo.OrdersVO;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.Controller.E_P002_D003ProductsController;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;
import project.user.service.UserService;
import project.user.vo.UserVO;


@Controller
public class B_P003_D001productDetailImpl implements B_P003_D001productDetail {
	private static final Logger logger = LoggerFactory.getLogger(B_P002_D001ControllerImpl.class);
	private static final String LOGIN = "LOGIN";
	
	@Autowired
	UserService userService;
	
	@Autowired
	B_P003_D001productService b_P003_D001productService;
	
	@Override         //상품 상세페이지
	@RequestMapping(value = "/productDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView prodDetail(@RequestParam Map<String, Object> info,HttpSession httpSession,HttpServletRequest request,HttpServletResponse response)throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		
		
		String prodNum = (String) info.get("prodNum");
		map.put("prodNum", Integer.parseInt(prodNum));

		if(httpSession.getAttribute(LOGIN)!=null) { //로그인을 했을 경우
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			map.put("userNum", userNum);
			mav.addObject("sessionId", id);
		}else {
			map.put("userNum", 0);
		}

		
		
		 Cookie[] cookies = request.getCookies();
		 Cookie checknum = null;
		 if(cookies != null && cookies.length > 0){
		  for(int i = 0; i< cookies.length; i++){
		   if(cookies[i].getName().equals("checknum")){
			   checknum = cookies[i];
		   }
		  }  
		 }
		 if(checknum == null){
		  System.out.println("checknum 없음");
		  Cookie newCookie = new Cookie("checknum","|"+prodNum+"|"); 
		  response.addCookie(newCookie);
		  newCookie.setMaxAge(20); //20초 설정
		  b_P003_D001productService.updateCNT(map);
		 }else{
		  System.out.println("checknum 있음");
		  String value = checknum.getValue();
		  System.out.println(value);
		  if(value.indexOf("|"+prodNum+"|") <  0){ // 입력한 번화와 일치하는 번호가 없으면 추가한다.
		   value = value+"|"+prodNum+"|";
		   checknum.setValue(value);
		   System.out.println("만료시간:"+checknum.getMaxAge());
		   response.addCookie(checknum);
		   b_P003_D001productService.updateCNT(map);
		  }
		 }
		
		try {


		List<Map> options = b_P003_D001productService.topDetail(map); //상단의 옵션들
		
		System.out.println("위시체크"+options.toString());

		//List<String> images = new ArrayList<String>();     // 제품 상세 다중이미지 출력
		List<Map> list = b_P003_D001productService.detailImages(map);  //상단 이미지
		List<Map> detailList=b_P003_D001productService.detailImagesBottom(map);
			
			
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
			



				    List<Map> afterList = b_P003_D001productService.afterList(map); //후기 리스트
				    float average = b_P003_D001productService.average(map);
				    System.out.println("에프러 리스트: "+afterList.toString());
				    mav.addObject("images",list); //상단 메인 이미지
				    mav.addObject("imagesBottom",detailList); //하단 디테일 이미지
					mav.addObject("prodDetail",options); // 상품 옵션들 (이미지 X)

					mav.addObject("afterList",afterList); // 상품후기 리스트
					mav.addObject("paging",page); // 상품후기 페이징
					mav.addObject("average",average); //평균값
					mav.setViewName("/shoppingMall/prodDetail");
			} catch (Exception e) {
				e.printStackTrace();
			}


		return mav;
	}


	
	
	
	

	public static String getRandomString(){  //파일업로드 시 랜덤값을 만들어줌
        return UUID.randomUUID().toString().replaceAll("-","");
    }
	
	
	
	@ResponseBody         //상품 후기등록
	@RequestMapping(value = "/myShop/addAfter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addAfter(@RequestParam Map<String,Object> info,HttpSession httpSession, MultipartHttpServletRequest upfile,HttpServletRequest request,HttpServletResponse response) throws Exception {
		String resEnt = null;
		
		List<MultipartFile> files = upfile.getFiles("photo");

		try {

		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘
		info.put("userNum", userNum);

		String imagePath = "/resources/img/"; 
		String path = request.getSession().getServletContext().getRealPath("/");// locallhost8080/
		String savePath = path + imagePath;   //
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
        
		File file = new File(savePath);    //폴더를 생성
        if(file.exists() == false){
            file.mkdirs();
        }
		for (MultipartFile mf : files) {   //넘어온 파일 개수만큼 돌리고
	        originalFileName = mf.getOriginalFilename();
	        originalFileExtension = mf.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
	        storedFileName = getRandomString() + originalFileExtension;   //위에 랜덤값을 뽑아주는 매소드 + 
			System.out.println("originFileName : " + originalFileName);
			System.out.println("originalFileExtension : " + originalFileExtension);
			System.out.println("storedFileName : " + storedFileName);
			file = new File(savePath + storedFileName);
	        System.out.println(file.getAbsolutePath()); //파일 절대 경로
	        mf.transferTo(file); // 파일들을 file 경로로 넣	는다
	        info.put("photo",storedFileName );
	        info.put("photoName", originalFileName);
		}
		

			b_P003_D001productService.addAfter(info);

		} catch (Exception e) {

			e.printStackTrace();
		}
		return resEnt;
	}

	/*
	@ResponseBody         //상품 후기등록
	@RequestMapping(value = "/myShop/addAfter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<String> addAfter(@RequestParam Map<String,Object> info,HttpSession httpSession, MultipartHttpServletRequest upfile,HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String message;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		List<MultipartFile> files = upfile.getFiles("photo");
		if(httpSession.getAttribute(LOGIN)==null) {
			message = " <script>";
			message += " alert('로그인 후 이용가능합니다.');";
			message += " location.href='" + request.getContextPath() + "/productDetail.do?prodNum="+info.get("prodNum")+"'; ";
			message += " location.reload(); ";
			message += " </script>";
			return resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		if(files.get(0).getOriginalFilename()=="") {
			message = " <script>";
			message += " alert('하나 이상의 사진을 올려주세요');";
			message += " location.href='" + request.getContextPath() + "/productDetail.do?prodNum="+info.get("prodNum")+"'; ";
			message += " location.reload(); ";
			message += " </script>";
			return resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘
		info.put("userNum", userNum);

		String imagePath = "/resources/img/";
		String path = request.getSession().getServletContext().getRealPath("/");// locallhost8080/
		String savePath = path + imagePath;   //두개를 합치면  :locallhost8080/resources/img/+
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

		File file = new File(savePath);    //폴더를 생성
        if(file.exists() == false){
            file.mkdirs();
        }
		for (MultipartFile mf : files) {   //넘어온 파일 개수만큼 돌리고
	        originalFileName = mf.getOriginalFilename();
	        originalFileExtension = mf.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
	        storedFileName = getRandomString() + originalFileExtension;   //위에 랜덤값을 뽑아주는 매소드 +
			System.out.println("originFileName : " + originalFileName);
			System.out.println("originalFileExtension : " + originalFileExtension);
			System.out.println("storedFileName : " + storedFileName);
			file = new File(savePath + storedFileName);
	        System.out.println(file.getAbsolutePath()); //파일 절대 경로
	        mf.transferTo(file); // 파일들을 file 경로로 넣	는다
	        info.put("photo",storedFileName );
	        info.put("photoName", originalFileName);
		}

		try {
			b_P003_D001productService.addAfter(info);
			RequestDispatcher dispatch = request.getRequestDispatcher("/productDetail.do?prodNum="+info.get("prodNum")+"");
			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/myShop/addAfter.do'; ";
			message += " location.reload(); ";
			message += " </script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}*/
	
	
	
	@Override         // 댓글 등록
	@RequestMapping(value = "/myShop/addComent.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String addComent(@RequestParam Map<String, Object> info, HttpSession httpSession,HttpServletRequest request, HttpServletResponse response)
			throws Exception {

	    String result="";

		System.out.println("댓글달기:"+info.toString());
        String afterType = (String) info.get("afterType");
        String prodNum = (String) info.get("prodNum");
        

        String id = (String) httpSession.getAttribute(LOGIN); //아이디
        int userNum = userService.selectUserNum(id);

        info.put("userNum", userNum);
        info.put("prodNum", Integer.parseInt(prodNum));
        info.put("afterType", Integer.parseInt(afterType));

		try {
			b_P003_D001productService.addComent(info);
			result="success";

		} catch (Exception e) {

		     result="fail";
			e.printStackTrace();
		}		
		return result;
	}



	@Override  	       //             사용안함
	@RequestMapping(value = "/AfterImage/{num}")
	public ResponseEntity<byte[]> getAfterImage(@PathVariable("num") int num,
		HttpServletRequest req, HttpServletResponse res)throws Exception {
		productAfterVO vo = new productAfterVO();
		vo.setAfterNum(num);
		vo = b_P003_D001productService.getImage(vo);
		//byte[] imageContent = (byte[])vo.getPhoto();  //가져온 데이터를 바이트로 뿌린다
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(/*imageContent*/ headers, HttpStatus.OK);
		}
	
	
	
	@Override               //구매하기 진행중 
	@RequestMapping(value = "/myShop/buyProd.do")
	public ModelAndView buyProduct(@RequestParam Map<String,Object> info,
			HttpSession httpSession,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> select = new HashMap<String,Object>();

		try {

		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘
		HttpSession session = req.getSession();
		
		
		String type = (String) info.get("type");   // 1번=즉시구매 , 3번=장바구니에서 결제
		select.put("userNum", userNum);
		Map<String,Object> deli = b_P003_D001productService.getAddress(select);//             작업중
		

		select =b_P003_D001productService.buyerinfo(select);//포인트
		mav.addObject("address",deli );                     //기본주소
		mav.addObject("point", select.get("point"));        //유저포인트
		
		if (type.equals("1") ) {     //즉시구매    진행중
			System.out.println("즉시구매");
			List<Map> cart = (List<Map>) session.getAttribute("selectProduct");
			System.out.println("디테일 카트 리스트"+cart.toString());
			mav.addObject("prodDetail", cart);
			
		}else if (type.equals("3")) {// 장바구니 물건 결제      
			System.out.println("장바구니 구매");
			select.put("userNum", userNum);
			List<Map> cart = (List<Map>) session.getAttribute("selectCart");
			System.out.println("넘어온 카트 리스트"+cart.toString());
			mav.addObject("prodDetail", cart);
		}
		mav.addObject("type",type);
		mav.setViewName("/shoppingMall/payTest");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	
	
	@Override
	@RequestMapping(value = "/payInfo.do")    //결제완료
	@ResponseBody
	public String insertPayinfo(@RequestParam Map<String, Object> info,HttpSession httpSession,
			@RequestParam(value = "prodNums[]") List<Integer> prodNums,
			@RequestParam(value = "quantityToDB[]") List<Integer> quantityToDB,
			@RequestParam(value = "orderNums[]") List<Integer> orderNums,
			@RequestParam(value = "perTotals[]") List<Integer> perTotals,
			@RequestParam(value = "prodPrices[]") List<Integer> prodPrices,
			@RequestParam(value = "optionNums[]") List<Integer> optionNums,
			@RequestParam(value = "payNames[]") List<String> payNames,
			HttpServletRequest request, HttpServletResponse response) {

		String result="";
		try {
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘

			result=b_P003_D001productService.insertPaymentTest(payNames,info, userNum, prodNums, quantityToDB,
					orderNums, perTotals, prodPrices, optionNums);

		} catch (Exception e) {

			result="fail";
		}


		return result;
	}
	
	
	
	
	@Override              // 장바구니 추가    메인 ->장바구니        오더타입 3
	@RequestMapping(value = "/myShop/addCartMain.do")
	public ResponseEntity<String> addCartMain(@RequestParam Map<String, Object> info,HttpSession httpSession) throws Exception {
		System.out.println("장바구니 추가 메인---> 장바구니"+info.toString()); //  prodNum=117, prodName=테스트, prodPrice=12, addType=main
		String message;
        ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		if(httpSession.getAttribute(LOGIN)==null) {
			message = " <script>";
			message += " alert('로그인 후 이용가능합니다.');";
			message += " location.href='/shopMainCate.do'";
			message += " </script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			return resEnt;

		}


		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum2 = userService.selectUserNum(id);         //유저넘
		
		int orderType=3; // 장바구니2 (메인화면에서 수량선택없이 추가한 애들)
		
		String addType= (String) info.get("addType");
		String message2=null;
		
	    String price =(String) info.get("prodPrice");  // 콤마 제거작업
	    Integer.parseInt(price.replace(",","").trim());

		Map<String,Object> param = new HashMap<String,Object>();
		
		List<Integer> result= b_P003_D001productService.searchOption(info);
		
		param.put("optionNum", result.get(0));
		param.put("userNum", userNum2);
		param.put("prodNum", Integer.parseInt((String) info.get("prodNum")));
		param.put("prodName", info.get("prodName"));
		param.put("prodPrice", Integer.parseInt(price.replace(",","").trim()));
		
		try {
			
		    if(result.size()==1&&addType.equals("cart")) { //옵션이 하나이므로 그냥 장바구니에 추가 (번호 2)
		    orderType=2;
			param.put("orderType", orderType);
			System.out.println("인설트전 정보"+param.toString());
			b_P003_D001productService.addCartOne(param);
			message2="장바구니";
			
		    }else if(result.size()>1&&addType.equals("cart")) {   //옵션이 2개이상  (번호3)
				orderType=3;
				param.put("orderType", orderType);
			 b_P003_D001productService.addCartOne(param);
			 message2="장바구니";
			 
		    }else if(addType.equals("wish")) {  //위시리스트    prodlike table에 insert
		    	Map<String,Object> wish = new HashMap<String,Object>();
		    	wish.put("userNum", userNum2);
				wish.put("prodNum", Integer.parseInt((String) info.get("prodNum")));
				b_P003_D001productService.addprodLike(wish);
				message2="위시리스트";
		    }
		    
			message = " <script>";
			message += " alert('"+message2+" 추가완료.');";
			message += " location.href='/shopMainCate.do?listType=100'; ";
			message += " </script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			return resEnt; 
		} catch (Exception e) {
           e.printStackTrace();
             message = " <script>";
			message += " alert(' 실패.');";
			message += " location.href='/shopMainCate.do?listType=100'; ";
			message += " </script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resEnt;
	}
	
	
	@Override            // 장바구니 추가    디테일 ->장바구니       오더타입 2번
	@RequestMapping(value = "/myShop/addCart.do")
	public ResponseEntity<String> addCart(@RequestParam Map<String,Object> info,
			@RequestParam(value = "prodNums[]")List<Integer> prodNums,
			@RequestParam(value = "prices[]")List<Integer> prices,
			@RequestParam(value = "optionnums[]")List<Integer> optionnums ,
			@RequestParam(value = "quantities[]")List<Integer> quantities,
			HttpServletRequest req, HttpServletResponse res,HttpSession httpSession)
			throws Exception {
		System.out.println("장바구니 추가 파람 정보들 : "+info.toString());
		String message;
        ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String requestType = (String) info.get("addType"); 

		
		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum2 = userService.selectUserNum(id);         //유저넘
		
	
		int orderType=2; // 장바구니2 (디테일화면에서  수량선택 후 추가한 애들)
		
		try {

		            //수량체크 로직
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("userNum", userNum2);
			param.put("prodNum", prodNums.get(0));
			//param.put("prodName", info.get("prodName"));
			//param.put("prodPrice",Integer.parseInt((String) info.get("prodPrice")));
			param.put("type", requestType);  
			List<Integer> quantity = b_P003_D001productService.checkQuantity(param);  //수량체크
			if(quantity.contains(0)) {
			System.out.println("수량부족");
			message = " <script>";
			message += " alert('재고가 떨어졌습니다 ');";
			message += " location.href='/shopMainCate.do?listType=100'; ";
			message += " </script>";
			return resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		


		try {
     			if (requestType.equals("상품디테일")) {     //       --완료----
				List<Map> addCart = new ArrayList<Map>(); // 상품디테일에서 가져온정보를 담을 그릇
				for(int i=0;i<optionnums.size();i++) {
					Map<String,Object> detailParam = new HashMap<String,Object>();
					detailParam.put("prodNum", prodNums.get(i));
					detailParam.put("optionNum", optionnums.get(i));
					detailParam.put("quantity", quantities.get(i)); 
					detailParam.put("price", prices.get(i));
					detailParam.put("userNum", userNum2);
					detailParam.put("orderType", orderType);
					addCart.add(detailParam);
				}
				System.out.println("디테일 배열 정보 : "+addCart.toString());
				b_P003_D001productService.addCart(addCart);
				message = " <script>";
				message += " alert('추가되었습니다.');";
				message += " location.href='/shopMainCate.do?listType=100'; ";
				message += " </script>";
				resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			}
			

		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='/shopMainCate.do?listType=100'; ";
			message += " </script>";
			resEnt = new ResponseEntity<String>(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	



	@Override       //장바구니 상품 중복체크            (보류)   
	@RequestMapping(value = "/checkCart")
	@ResponseBody
	public String checkCart(Map<String, Object> info, HttpServletRequest req, HttpServletResponse res) throws Exception {
		Map<String,Object> param = new HashMap<String,Object>();
		String result = "";
		int checkProdNum = Integer.parseInt((String) info.get("prodNum"));
		param.put("prodNum", checkProdNum);
		Integer check = b_P003_D001productService.checkCart(param);
		if(check.equals("")||check==null) {
			result="ok";
		}else {
			result="already";
		}
		return result;
	}


	
	@Override          //세션에 아이디 불러오는 용도의 아작스
	@RequestMapping(value = "/getSession.do")
	@ResponseBody
	public Map<String,Object> getSession(HttpServletRequest req, HttpServletResponse res,HttpSession httpSession) throws Exception {
		//세션에서 아이디 정보를 꺼내온다
		Map<String,Object> param = new HashMap<String,Object>();
		
		if(httpSession.getAttribute(LOGIN)==null) {
			param.put("checkStatus", "empty");
		}else {
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			param.put("checkStatus", "notEmpty");
			param.put("id", id);
			param.put("userNum", userNum);
			System.out.println("세션정보"+param.toString());
		}
		return param;
	}

	
	
	public String checkUserSession(HttpServletRequest req, HttpServletResponse res,HttpSession httpSession) throws Exception {
		Map<String,Object> param = new HashMap<String,Object>();
		String result ="";
		if(httpSession.getAttribute(LOGIN)==null) {
			result ="empty";
		}else {
			result="notEmpty";
		}
		return result;
	}


	@Override               //위시리스트
	@RequestMapping(value = "/wishList.do")
	public ModelAndView wishList(Map<String, Object> info, HttpSession httpSession, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView(); //파라미터에 prodNum , quantity,prodName 있다
		
		Map<String,Object> map = new HashMap<String,Object>();

		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘
		
		
		String nowPage = req.getParameter("nowPage");
		String cntPerPage = req.getParameter("cntPerPage");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		
		try {
			int total = b_P003_D001productService.wishCount(userNum);
			Paging page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			map.put("userNum", userNum); //유저 번호
			map.put("start", page.getStart());
			map.put("end", page.getEnd());
			List<Map> list = b_P003_D001productService.selectWishList(map);  // prodlike,products,prodphoto,productafter 테이블 조인 결과물

			mav.addObject("userId", id); // 아이디
			mav.addObject("cartList", list); // prodlike 테이블
			mav.addObject("paging", page);

			mav.setViewName("/shoppingMall/wishList");

		} catch (Exception e) {
		    e.printStackTrace();
		}
		return mav;
	}

	

	@Override            //구매내역
	@RequestMapping(value = "/paymentList.do")
	public ModelAndView paymentList(@RequestParam Map<String, Object> info, HttpSession httpSession, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		//구매내역 결과
		//IMP_UID=imp_554052595038, MIN(PAY={ORDERNUM)=43}, APPLY_NUM=kakao, BUYERNAME=강현웅, TOTALPRICE=400,
		//MERCHANT_UID=merchant_1603425054491,
     	//NAME=테스트, DELIVERY=1, CREATEDAT=2020-10-23 12:51:30.0, COUNT=1, USED=0, RN=1, TYPE=card},
		// ORDERSTATUS
	ModelAndView mav = new ModelAndView(); //파라미터에 prodNum , quantity,prodName 있다
		Map<String,Object> map = new HashMap<String,Object>();

		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘
		map.put("userNum", userNum); //유저 번호
		
		String nowPage = req.getParameter("nowPage");
		String cntPerPage = req.getParameter("cntPerPage");
		String startD = (String) info.get("startD");
		String endD = (String) info.get("endD");
		String listType= (String) info.get("listType");
		String deliveryStatus= (String) info.get("deliveryStatus");

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}

		if(listType==null) { //100이면 일반
			listType="100";
		}
		if(deliveryStatus==null) {
			deliveryStatus="100";
		}
		
		
		try {

		map.put("startD", startD);
		map.put("endD", endD);
		map.put("listType", listType);
		map.put("deliveryStatus", deliveryStatus);
		System.out.println("리스트타입:"+map.toString());

		int total = b_P003_D001productService.totalPaymentCount(map);
		Paging page = new Paging(startD,endD,Integer.parseInt(listType),Integer.parseInt(deliveryStatus),total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		map.put("listType", page.getListType());
		map.put("deliveryStatus", page.getListType2());
		map.put("startD", page.getStarD());
		map.put("endD", page.getEndD());
		List<Map> list =b_P003_D001productService.paymentList(map);
		mav.addObject("userId", id); // 아이디
		mav.addObject("payList", list); //장바구니 4번 (주문조회)
		mav.addObject("paging", page);
		
		System.out.println("구매내역:"+list.toString());
		mav.setViewName("/shoppingMall/paymentList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}



	@Override           //장바구니
	@RequestMapping(value = "/myShop/cartList.do")
	public ModelAndView cartList(@RequestParam Map<String, Object> info,HttpSession httpSession,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView(); //파라미터에 prodNum , quantity,prodName 있다
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> map2 = new HashMap<String,Object>();

		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘
		map.put("userNum", userNum); //유저 번호
		map2.put("userNum", userNum); //유저 번호
		


		String nowPage = req.getParameter("nowPage");
		String cntPerPage = req.getParameter("cntPerPage");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}

		try {
		map.put("orderType", 2);//상품디테일에서 옵션을 선택한 애들
		int total = b_P003_D001productService.CartTotal(map);
		Paging page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		List<Map> list = b_P003_D001productService.CartList(map);  // products,prodoption,prodphoto,orders 테이블 조인 결과물 

		
		
		String nowPage2 = req.getParameter("nowPage2");
		String cntPerPage2 = req.getParameter("cntPerPage2");
		if (nowPage2 == null && cntPerPage2 == null) {
			nowPage2 = "1";
			cntPerPage2 = "3";
		} else if (nowPage2 == null) {
			nowPage2 = "1";
		} else if (cntPerPage2 == null) { 
			cntPerPage2 = "3";
		}
		map2.put("orderType", 3);//메인에서 옵션을 선택하지않은 애들
		int total2 = b_P003_D001productService.CartTotal(map2);
		Paging page2 = new Paging(total2, Integer.parseInt(nowPage2), Integer.parseInt(cntPerPage2));
		map2.put("start", page2.getStart());
		map2.put("end", page2.getEnd());
		List<Map> list2 = b_P003_D001productService.CartList(map2);
		System.out.println("옵션서택안한애들 :"+list2.size());
				
		
		mav.addObject("userId", id); // 아이디
		mav.addObject("cartList", list); //장바구니 2번 (옵션이 선택된 상품들)
		mav.addObject("paging", page);
		
		mav.addObject("cartList2", list2); //장바구니 3번 (옵션이 선택되지 않은 상품들)
		mav.addObject("paging2", page2);
		
		mav.setViewName("/shoppingMall/cart");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@Override   
	@RequestMapping(value = "/chooseOption.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map> chooseOption(@RequestParam Map<String, Object> info,HttpSession httpSession, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		System.out.println("넘어온 정보"+info.toString());      //prodNum
		List<Map> list= new ArrayList<Map>();
		try {

			info.put("userNum", 0);
		       list = b_P003_D001productService.topDetail(info); //상단의 옵션들
		       System.out.println(list.toString());
		       return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	


	@Override
	@RequestMapping(value = "/modOption", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String modOption(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		System.out.println("넘어온 정보"+info.toString());//넘어온 정보{ordernum=182, optionNum=107, quantity=1, perPrice=1111111}
		String result="";
		try {
			b_P003_D001productService.modOption(info);
			return result="success";
		} catch (Exception e) {
		    e.printStackTrace();
		    result="fail";
		}
		
		return result;
	}


	@Override
	@ResponseBody
	@RequestMapping(value = "/deleteCart")
	public void deleteCart(@RequestParam Map<String, Object> info, HttpServletRequest req, HttpServletResponse res,HttpSession httpSession)
			throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		//세션에서 값 뽑아올것
		
		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘
		
		try {

			map.put("userNum", userNum);
			map.put("orderNum",Integer.parseInt((String) info.get("deleteNum")));     //상품번호로 바꿀것 orderNum
			b_P003_D001productService.deleteCart(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	

	@Override          //상품디테일에서 선택한 상품 
	@RequestMapping(value = "/myShop/buyProdFromDetail.do")
	public void buyProductFromDetail(Map<String, Object> info,
			@RequestParam(value = "prodNums[]") List<Integer> prodNums,
			@RequestParam(value = "optionnums[]") List<Integer> optionnums,
			@RequestParam(value = "quantities[]") List<Integer> quantities,
			@RequestParam(value = "prices[]") List<Integer> prices,
			@RequestParam(value = "optionNums[]") List<Integer> optionNums,
			@RequestParam(value = "prodSizes[]") List<String> prodSizes,
			@RequestParam(value = "prodColors[]") List<String> prodColors,
			@RequestParam(value = "prodNames[]") List<String> prodNames,
			@RequestParam(value = "prodImages[]") List<String> prodImages,
			HttpSession httpSession, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		String orderNum ="0"; //임시번호

		try {
		
		List<Map> list = new ArrayList<Map>();
		for(int i=0; i<optionnums.size(); i++) {
			Map<String,Object> value = new HashMap<>();
			value.put("ORDERNUM", 0); //임시번호
			value.put("QUANTITY", quantities.get(i));
			value.put("IMAGE", prodImages.get(i));
			value.put("NAME", prodNames.get(i));
			value.put("PRICE", prices.get(i));
			value.put("PRODNUM", prodNums.get(i));
			value.put("COLOR", prodColors.get(i));
			value.put("PRODSIZE", prodSizes.get(i));
			value.put("OPTIONNUM", optionNums.get(i));
			list.add(value);
		}
		System.out.println("디테일 구매:"+list.toString());
		HttpSession session = req.getSession();
		session.setAttribute("selectProduct", list); 
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	@ResponseBody             //장바구니에서 선택한 상품 배열로 가져오는 메소드
	@RequestMapping(value = "/butProductsFromCart")
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
			HttpServletRequest req, HttpServletResponse res,HttpSession httpSession)
			throws Exception {
		
		String result="";

		try {


		List<Map> list = new ArrayList<Map>();
		for(int i=0; i<totalPrice.size(); i++) {
			Map<String,Object> value = new HashMap<>();
			value.put("TOTALDDDD", totalPrice.get(i));
			value.put("ORDERNUM", orderNums.get(i));
			value.put("QUANTITY", quantities.get(i));
			value.put("IMAGE", images.get(i));
			value.put("NAME", prodNames.get(i));
			value.put("PRICE", prices.get(i));
			value.put("PRODNUM", prodNums.get(i));
			value.put("COLOR", colors.get(i));
			value.put("PRODSIZE", sizes.get(i));
			value.put("OPTIONNUM", optionNums.get(i));
			list.add(value);
		}
		System.out.println("장바구니:"+list.toString());
		HttpSession session = req.getSession();
		session.setAttribute("selectCart", list);
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	
	@Override            //중고물품 등록
	@RequestMapping(value = "/myShop/addUsedPro.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String addUsedProduct(MultipartHttpServletRequest upfile,HttpSession httpSession,
			@RequestParam Map<String,Object> info,
			@RequestParam(value = "quantity[]")List<Integer> quantity,
			@RequestParam(value = "prodSize[]")List<String> prodSize,
			@RequestParam(value = "prodstatus[]")List<Integer> prodstatus,
			@RequestParam(value = "color[]")List<String> color,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("등록 넘어온 값 : "+info.toString());
		Map<String, Object> addProd = new HashMap<String, Object>();//prod 정보를 받음 Map을 선언
		Map<String,Object> addCate= new HashMap<String,Object>();
		
		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘
        String result ="";
        
	
		String imagePath = "/resources/img/"; 
		String path = request.getSession().getServletContext().getRealPath("/");// 실제경로
		String savePath = path + imagePath;   
		//C:\Users\LG\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\hiking1102\resources\img
        String originalFileName = null;
        String storedFileName = null;
        String originalFileExtension = null;
        


		Enumeration enu = request.getParameterNames();   //상세내용 추가
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement(); 
			String value = request.getParameter(name); 
			addProd.put(name, value);   
		}
		
		addProd.put("userNum", userNum);
		b_P003_D001productService.addUsedProduct(addProd);// 상품상세내용 추가
		int prodNum = b_P003_D001productService.prodNum();  // prducts table prodnum 맥스값
		//int optionNum= b_P003_D001productService.optionNum(); //시퀀스
		
		List<Map> addOption=new ArrayList<Map>();;
		for(int i=0;i<prodstatus.size();i++) {     //옵션 추가
			Map<String,Object> putOption = new HashMap<String, Object>();
			putOption.put("quantity", quantity.get(i));
			putOption.put("prodSize", prodSize.get(i));
			putOption.put("prodStatus", prodstatus.get(i));
			putOption.put("color", color.get(i));
			putOption.put("prodNum", prodNum);
			//putOption.put("optionNum", optionNum+i);
			addOption.add(putOption);
		}
		b_P003_D001productService.addOption(addOption);   //옵션
		
		
		
		List<MultipartFile> Mainfiles = upfile.getFiles("content");
		List<MultipartFile> Detailfiles= upfile.getFiles("contentDetail");
		
		File file = new File(savePath);
        if(file.exists() == false){
            file.mkdirs();
        }
        List<Map> mainFileList = new ArrayList<Map>();;

        for(int i=0;i<Mainfiles.size();i++) {     //메인이미지  인설트
        	Map<String,Object> main= new HashMap<String,Object>();
	        originalFileName = Mainfiles.get(i).getOriginalFilename();
	        originalFileExtension = Mainfiles.get(i).getOriginalFilename().substring(originalFileName.lastIndexOf("."));//파일 확장자
	        storedFileName = getRandomString() + originalFileExtension;   // 랜덤값 + 확장자          wqdnwq.png 등등
	        
			file = new File(savePath + storedFileName);
	        System.out.println(file.getAbsolutePath()); //파일 절대 경로(실제저장된 주소)
	        Mainfiles.get(i).transferTo(file); // 파일들을 file 경로로 넣는다
	        
	        main.put("content", storedFileName);
	        main.put("pphotoNum", i+1);
	        main.put("originalFileName", originalFileName);
	        main.put("userNum", userNum);
	        mainFileList.add(main);
		}
        
		List<Map> DetailFileList= new ArrayList<Map>();
		int nextIndex = Mainfiles.size()+1;
		
        for(int i=0;i<Detailfiles.size();i++) {     //디테일이미지는 업데이트  (min으로 pphotonum +1을하여 넣자)
        	Map<String,Object> detail= new HashMap<String,Object>();
	        originalFileName = Detailfiles.get(i).getOriginalFilename();
	        originalFileExtension = Detailfiles.get(i).getOriginalFilename().substring(originalFileName.lastIndexOf("."));//파일 확장자
	        storedFileName = getRandomString() + originalFileExtension;   // 랜덤값 + 확장자          wqdnwq.png 등등
			file = new File(savePath + storedFileName);
	        System.out.println(file.getAbsolutePath()); //파일 절대 경로
	        Detailfiles.get(i).transferTo(file); // 파일들을 file 경로로 넣는다
	        
	        detail.put("contentDetail", storedFileName);
	        detail.put("pphotoNum", i+nextIndex);
	        
	        DetailFileList.add(detail);
        }
        
	
		

    	try {
			b_P003_D001productService.saveUsedImage(mainFileList); //메인 이미지
			b_P003_D001productService.saveUsedDetailImage(DetailFileList); //디테일 이미지   
			result="success";
			
		} catch (Exception e) {
			e.printStackTrace();
			result="fail";
		}
		return result;
	}

	/*
	@Override            //중고물품 등록     백업용
	@RequestMapping(value = "/addUsedPro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addUsedProduct(MultipartHttpServletRequest upfile,
			@RequestParam Map<String,Object> info,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> dataMap = new HashMap<String, Object>();//prod 정보를 받음 Map을 선언
		
		String imagePath = "/resources/img/"; 
		String path = request.getSession().getServletContext().getRealPath("/");// locallhost8080/
		String savePath = path + imagePath;   //두개를 합치면  :locallhost8080/resources/img/
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
		
		Enumeration enu = request.getParameterNames();  //인풋의 name으로된 정보들을  가져와 이뮤너레이션 객체를 이용해 반복하여 map에 넣어주는 작업
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement(); //name값을 돌면서 String name에 넣는것
			String value = request.getParameter(name);  //넣을 이름을 토대로 값을 받아온 후
			dataMap.put(name, value);                      // map에 하나씩 저장
		}
		
		List<E_P002_D003PhotoVO> imageFileList = new ArrayList<E_P002_D003PhotoVO>(); //맵에 추가할 정보들
		E_P002_D003PhotoVO vo;
		List<MultipartFile> files = upfile.getFiles("content");
		File file = new File(savePath);    //폴더를 생성
        if(file.exists() == false){
            file.mkdirs();
        }
        for(int i=0;i<files.size();i++) {
        	vo =new E_P002_D003PhotoVO();
	        originalFileName = files.get(i).getOriginalFilename();
	        originalFileExtension = files.get(i).getOriginalFilename().substring(originalFileName.lastIndexOf("."));//파일 확장자
	        storedFileName = getRandomString() + originalFileExtension;   // 랜덤값 + 확장자          wqdnwq.png 등등
			file = new File(savePath + storedFileName);
	        System.out.println(file.getAbsolutePath()); //파일 절대 경로
	        files.get(i).transferTo(file); // 파일들을 file 경로로 넣는다
	        vo.setContent(storedFileName);
	        vo.setpPhotoNum(i+1);
	        imageFileList.add(vo);
		}
		
		mav.setViewName("/shoppingMall/applyUsedPro");
		try {
			b_P003_D001productService.addUsedProduct(dataMap);// 상품상세내용 추가
			b_P003_D001productService.saveUsedImage(imageFileList); //이미지 추가
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return mav;
	}*/


	@Override
	@RequestMapping(value = "/addUsedForm", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addForm(HttpServletResponse response,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shoppingMall/applyUsedPro");
		return mav;
	}
	
	
	@ResponseBody    //테스트용
	@RequestMapping(value = "/test2", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Map> test(@RequestBody List<Map> list) throws Exception {
		System.out.println("map : "+ list.toString());
		List<Map> list2 = b_P003_D001productService.test(list);
		return list2;
	}




	@ResponseBody    //결제취소 테스트
	@RequestMapping(value = "/cancelPay.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test(@RequestParam Map<String,Object> info) throws Exception {
		System.out.println(info.toString());
		JSONObject json = new JSONObject();
		String result ="";

		String test= (String) info.get("test");  //imp_uid 아이디를 보낼것
		String merchant= (String) info.get("merchant");
		String token = getToken();

		json.put("merchant_uid", merchant);
		json.put("imp_uid", test);
		//json.put("cancel_request_amount", 500);
		json.put("reason", "결제실패 테스트");
		String requestURL ="https://api.iamport.kr/payments/cancel";
		String requestString = "";
		try{
			URL url = new URL(requestURL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setInstanceFollowRedirects(false);
			connection.setRequestMethod("POST");  //요청
			connection.setRequestProperty("Content-Type", "application/json"); //해더설정
			connection.setRequestProperty("Authorization", token);             //해더설정

			OutputStream os= connection.getOutputStream();
			os.write(json.toString().getBytes());  //입력정보를 보내는작업
			connection.connect();
			StringBuilder sb = new StringBuilder();
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;
				while ((line = br.readLine()) != null) {
					sb.append(line + "\n");
				}
				br.close();
				requestString = sb.toString();     //전달된 값은 json형태의 String값
				System.out.println("취소결과:"+requestString.toString());
			}
			os.flush();
			connection.disconnect(); //연결을 끊어줌


			JSONParser parser = new JSONParser(); // 전달받은 json형식의 문자열을 파싱하기위함
			JSONObject obj = (JSONObject) parser.parse(requestString);
			if((Long)obj.get("code")  == 0){      // 0이면  서버 통신이 잘 되었다는 의미
				JSONObject getToken = (JSONObject) obj.get("response"); // 아임포트의 경우 response 이름으로 토큰값이 온다
				System.out.println("getToken==>>"+getToken.get("access_token"));
				return "ok";
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		//return "ok";
		return requestString;
	}
	
	
    
	           //토큰받기
	public String getToken() throws Exception{
		// requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보 
		String imp_key =URLEncoder.encode("5353642061154666", "UTF-8");
		String imp_secre=URLEncoder.encode("votbilARE9akApnczuM09pFwNJcyWLZratDtPektnuNYUbatFWuPlam9TyHQjGiuaWXZaityNhwHsHb8", "UTF-8");
		String requestURL ="https://api.iamport.kr/users/getToken"; //토큰 요청할 url
		JSONObject json = new JSONObject();
		
		json.put("imp_key", imp_key);      //바디에 들어갈 json형식의 데이터들
		json.put("imp_secret", imp_secre);  //header를 json으로 설정하였기때문에 제이슨으로 보낸다
		
		String _token = "";
		String requestString = "";
		try{
			URL url = new URL(requestURL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true); 				
			connection.setInstanceFollowRedirects(false);  
			connection.setRequestMethod("POST");  //요청
			connection.setRequestProperty("Content-Type", "application/json"); //해더설정
			OutputStream os= connection.getOutputStream();
			os.write(json.toString().getBytes());
			connection.connect();
			StringBuilder sb = new StringBuilder(); 
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  
				while ((line = br.readLine()) != null) {  
					sb.append(line + "\n");  
				}
				br.close();
				requestString = sb.toString();     //전달된 값을 String이다
				System.out.println(requestString.toString());
			}
			os.flush();
			connection.disconnect(); 
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(requestString);
			if((Long)obj.get("code")  == 0){
				JSONObject getToken = (JSONObject) obj.get("response");// key,value로 들어옴
				System.out.println("getToken==>>"+getToken.get("access_token"));
				_token = (String)getToken.get("access_token");
			}
		}catch(Exception e){
			e.printStackTrace();
			_token = "";
		}
		return _token;
	}







	@Override
	@ResponseBody
	@RequestMapping(value = "/updateMemo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateMemo(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpServletRequest request,
			HttpSession httpSession) throws Exception {
		String result ="";
		
		try {
			
		String id = (String) httpSession.getAttribute(LOGIN); 
		int userNum = userService.selectUserNum(id);         
		System.out.println(info.toString());  //{commentText=zzzz, addCommentgo=1}
		
			b_P003_D001productService.updateMemo(info);
			result="success";
		} catch (Exception e) {
             e.printStackTrace();
             result="fail";
		}
		
		return result;
	}







	@Override
	@ResponseBody
	@RequestMapping(value = "/addCartFromWish.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addCartFromWish(		
			@RequestParam(value = "likenums[]")List<Integer> likenums,
			@RequestParam(value = "quantities[]")List<Integer> quantities,
			@RequestParam(value = "optionNums[]")List<Integer> optionNums,
			@RequestParam(value = "prodNames[]")List<String> prodNames,
			@RequestParam(value = "prices[]")List<Integer> prices,
			@RequestParam(value = "prodNums[]")List<Integer> prodNums,
			HttpServletRequest req,HttpServletResponse res, HttpSession httpSession) throws Exception {
		//userNum=22, prodNum=116, quantity=1, price=35000, prodName=모자, likeNum=9, optionNum=104
		String result ="";
		List<Map> param = new ArrayList<Map>();
		
		try {
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			
			for(int i=0;i<prodNums.size();i++) {
				Map<String,Object> info = new HashMap<String,Object>();
				info.put("likeNum", likenums.get(i));
				info.put("quantity", quantities.get(i));
				info.put("optionNum", optionNums.get(i));
				info.put("prodName", prodNames.get(i));
				info.put("price", prices.get(i));
				info.put("prodNum", prodNums.get(i));
				info.put("userNum", userNum);
				param.add(info);
			}
			
			b_P003_D001productService.addCartFromWish(param);
			b_P003_D001productService.deleteWish(param);
			
			
			
			result="success";
			System.out.println("위시 -> 장바구니:"+param.toString());		
		} catch (Exception e) {
			e.printStackTrace();
			result="fail";
			
		}
		
		
		return result;
	}







	@Override
	@ResponseBody
	@RequestMapping(value = "/deleteWish.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteWish(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpServletRequest request,
			HttpSession httpSession) {
		String result="";
		
		try {
			
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			
			b_P003_D001productService.deleteWishOne(info);
			result="success";
		} catch (Exception e) {
			e.printStackTrace();
			result="fail";
		}
		return result;
	}






	@Override
	@RequestMapping(value = "/addDeliveryForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addDeliveryForm(Map<String, Object> info, HttpServletResponse response, HttpServletRequest request,
			HttpSession httpSession) {
		
		ModelAndView mav= new ModelAndView();
		
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			
		
		mav.addObject("userNum", userNum);
		mav.setViewName("/shoppingMall/addDeliveryForm");
		return mav;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/addDelivery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addDelivery(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpServletRequest request,
			HttpSession httpSession) {
        String result="";
       try {
    	   b_P003_D001productService.addAddress(info);
    	   result="success";
	   } catch (Exception e) {
		e.printStackTrace();
		result="fail";
	   }
		return result;
	}







	@Override
	@RequestMapping(value = "/payListDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView payListDetail(@RequestParam Map<String, Object> info, HttpServletResponse response,
			HttpServletRequest request, HttpSession httpSession) {
		ModelAndView mav= new ModelAndView();
		System.out.println("구매내역 상세보기:"+info.toString());
		try {
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			
			info.put("userNum", userNum);
			List<Map> list =b_P003_D001productService.payDetailList(info);
			System.out.println("구매 상세페이지"+list.toString());
			mav.addObject("payDetailList", list);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		mav.setViewName("/shoppingMall/payListDetail");
		return mav;
	}







	@Override
	@RequestMapping(value = "/cancelPayForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String cancelPay(Map<String, Object> info, HttpServletResponse response, HttpServletRequest request,
			HttpSession httpSession) {       // 파라미터 : createDat  결제일

		try {
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘

			info.put("userNum", userNum);
		} catch (Exception e) {
		    e.printStackTrace();
		}

		return "/shoppingMall/cancelPay";
	}







	@Override
	@RequestMapping(value = "/applycancelPayment.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String applycancelPayment(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpServletRequest request,
			HttpSession httpSession) {
		//
		System.out.println("취소요청 값:"+info.toString());

		String result="";

		try {

			b_P003_D001productService.applycancelPay(info);

			result="success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

			result="fail";
		}

		return result;
	}


	@Override
	@RequestMapping(value = "/selectComment.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map> selectComment(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpServletRequest request) {

		List<Map> Commentlist =new ArrayList<Map>();

		try {
			System.out.println("에프터 번호 ,프로드넘:"+info.toString());
		 Commentlist =b_P003_D001productService.selectComment(info);
			System.out.println("댓글 리스트:"+Commentlist.toString());
			return Commentlist;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return Commentlist;
	}







	@Override         //내가신청한 중고내역
	@RequestMapping(value = "/myUsedList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myUsedList(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpServletRequest request,
			HttpSession httpSession) {
		ModelAndView mav= new ModelAndView();
		Map<String,Object> param = new HashMap<String,Object>();

		
		System.out.println("ddd"+info.toString());
		String nowPage = (String) info.get("nowPage");
		String cntPerPage = (String) info.get("cntPerPage");
		String listType = (String) info.get("listType");
		String listType2 = (String) info.get("listType2");
		String startD =(String) info.get("startD");
		String endD = (String) info.get("endD");
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "6";
		}
		if(listType==null) {
			listType="100";
		}
		if(listType2==null){
			listType2 ="10";
		}

		try {
		String id = (String) httpSession.getAttribute(LOGIN); //아이디
		int userNum = userService.selectUserNum(id);         //유저넘

		param.put("userNum", userNum);
		param.put("listType", listType);
		param.put("listType2", listType2);
		param.put("startD",startD );
		param.put("endD", endD);

		int total = b_P003_D001productService.totaladdUsed(param);
		Paging page = new Paging(startD,endD,Integer.parseInt(listType),Integer.parseInt(listType2),total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		param.put("start", page.getStart());
		param.put("end", page.getEnd());
		param.put("listType", page.getListType());
		param.put("listType2", page.getListType2());
		param.put("startD", page.getStarD());
		param.put("endD", page.getEndD());

		List<Map> list= b_P003_D001productService.selectMyUsedList(param);

		mav.addObject("myUsedList", list);
		mav.addObject("paging", page);
	    mav.setViewName("/shoppingMall/myUsedList");

	} catch (Exception e) {
	    e.printStackTrace();
	}
		return mav;
	}







	@Override
	@ResponseBody
	@RequestMapping(value = "/delAfter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String delAfter(@RequestParam Map<String, Object> info, HttpServletResponse response) {

		String result="";

		try {
			b_P003_D001productService.delAfter(info);
			result="success";
		} catch (Exception e) {
			result="fail";
			e.printStackTrace();
		}

		return result;
	}


	@Override
	@ResponseBody
	@RequestMapping(value = "/delComment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String delComment(@RequestParam Map<String, Object> info, HttpServletResponse response) {
	String result="";

		try {
			System.out.println("댓글삭제"+info.toString());
			b_P003_D001productService.delComment(info);
			result="success";
		} catch (Exception e) {
			result="fail";
			e.printStackTrace();
		}

		return result;
	}







	@Override
	@ResponseBody
	@RequestMapping(value = "/myShop/delwish.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String delwish(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpSession httpSession) {
		String result="";         //info = prodNum
		try {
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			
			info.put("userNum", userNum);
			b_P003_D001productService.delwish(info);
			result="success";
		} catch (Exception e) {
			e.printStackTrace();
			result="fail";
			// TODO: handle exception
		}
		return result;
	}


	@Override
	@ResponseBody
	@RequestMapping(value = "/myShop/addwish.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addwish(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpSession httpSession) {
		// TODO Auto-generated method stub
		String result="";         //info = prodNum
		try {
			String id = (String) httpSession.getAttribute(LOGIN); //아이디
			int userNum = userService.selectUserNum(id);         //유저넘
			
			info.put("userNum", userNum);
			b_P003_D001productService.addwish(info);
			result="success";
		} catch (Exception e) {
			e.printStackTrace();
			result="fail";
		}
		return result;
	}



	@Override
	@ResponseBody
	@RequestMapping(value = "/showMyProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String,List<Map>> showMyProduct(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpSession httpSession) {
		      //info 정보     = prodNum
		Map<String,List<Map>> result = new HashMap<String,List<Map>>();
		try {
			
			List<Map> mainImage = b_P003_D001productService.myMainImage(info);
			List<Map> detailImage = b_P003_D001productService.myDetailImage(info);
			List<Map> prodDetail = b_P003_D001productService.myProdDetail(info);
			
			result.put("mainImage", mainImage);
			result.put("detailImage", detailImage);
			result.put("prodDetail", prodDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}






	 //아작스 페이징 연습
	@Override 
	@RequestMapping(value = "/ajaxPaging.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ajaxPagingTest(HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("/practice/ajaxPaging");
		return mav;
	}

	@Override
	@RequestMapping(value = "/PagingResult.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Paging PgingResult(HttpServletResponse response, HttpServletRequest request) {
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		//String listType = request.getParameter("listType");
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "6";
		}
		
		/*if(listType==null) {       // 여러타입의 페이징을 처리해야할 경우 사용하면 좋을듯
			listType="default";
		}*/
		
		int total = b_P003_D001productService.ajaxTotal(); //products 테이블 사용 (테스트용) 
		Paging paging = new Paging(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage)); //계산 후 start,end 번호 뱉는다
		
		return paging;
	}
	
	@Override
	@RequestMapping(value = "/PagingValues.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> pagingValues(@RequestParam Map<String, Object> info, HttpServletResponse response,
			HttpSession httpSession) {
		List<Map<String,Object>> list = b_P003_D001productService.ajaxResult(info);
		return list;
	}

	
     // 아이비시트 연습용
	@Override
	@RequestMapping(value = "/ibsheet.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView ibsheet() {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("practice/ibsheet");
		return mav;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/ibsheetResult.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Map<String, Object>> ibsheetResult() {
		List<Map<String, Object>> result = b_P003_D001productService.ibsheet();
		return result;
	}
	
	@RequestMapping(value = "/chart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chart2() {
		return "/practice/chart";
	}

}




