package project.B_P003_D001.controller;

import java.io.File;

import java.util.ArrayList;


import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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
import project.B_P003_D001.vo.DeliveryVO;
import project.B_P003_D001.vo.OrdersVO;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.Controller.E_P002_D003ProductsController;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;
import project.user.vo.UserVO;


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
		//List<String> images = new ArrayList<String>();     // 제품 상세 다중이미지 출력
		List<E_P002_D003PhotoVO> list = b_P003_D001productService.detailImages(map);  
			System.out.println("넘어온 개수"+list.size());                                  
			
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
	    int average = b_P003_D001productService.average(map);
	    System.out.println("넘어온 "+afterList.size());
	    
	    mav.addObject("images",list); //하단 제품설명 이미지
		mav.addObject("prodDetail",vo); // 상단 제품 텍스트
		mav.addObject("afterList",afterList); // 상품후기 리스트
		mav.addObject("paging",page); // 상품후기 페이징
		mav.addObject("average",average); //평균값
		mav.setViewName("/shoppingMall/prodDetail");
		return mav;
	}



	public static String getRandomString(){  //파일업로드 시 랜덤값을 만들어줌
        return UUID.randomUUID().toString().replaceAll("-","");
    }
	
	@ResponseBody         //상품 후기등록
	@RequestMapping(value = "/B_P003_D001/addAfter", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity addAfter(@RequestParam Map<String, Object> info ,MultipartHttpServletRequest upfile,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		//회원에 관한것은 없기때문에 임의로 진행하였다 
		
		List<MultipartFile> files = upfile.getFiles("photo");
		
		String imagePath = "/resources/img/"; 
		String path = request.getSession().getServletContext().getRealPath("/");// locallhost8080/
		String savePath = path + imagePath;   //두개를 합치면  :locallhost8080/resources/img/+
		System.out.println("ddddddddddddddddddddd:"+savePath);
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
	        mf.transferTo(file); // 파일들을 file 경로로 넣는다
	        info.put("photo",storedFileName );
	        info.put("photoName", originalFileName);
		}
		
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
		//byte[] imageContent = (byte[])vo.getPhoto();  //가져온 데이터를 바이트로 뿌린다
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(/*imageContent*/ headers, HttpStatus.OK);
		}
	
	
	@Override               //구매하기 진행중 
	@RequestMapping(value = "/B_P003_D001/buyProd")
	public ModelAndView buyProduct(@RequestParam Map<String,Object> info,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> select = new HashMap<String,Object>();
		//세션에 값이 있다는 가정하에  유저번호 1번으로 진행하겠다     즉, 유저번호/상품번호/수량으로 최초 시작
		int userNum =1;
		HttpSession session = req.getSession();
		//String  session.getAttribute("");
		
		String type = (String) info.get("type");   // 1번=즉시구매 , 2번=장바구니에서 결제
		System.out.println("파라미터 type 검사:"+type);
		
		select.put("userNum", userNum);
		UserVO deli = b_P003_D001productService.getAddress(select);//주소
		select =b_P003_D001productService.buyerinfo(select);//포인트
		mav.addObject("address",deli );                     //기본주소
		mav.addObject("point", select.get("point"));        //유저포인트
		
		if (type.equals("1") ) {     //즉시구매           ///////////////////////////////////////ㄹ
			System.out.println("즉시구매");
			String prodNum = (String) info.get("prodNum");
			info.put("prodNum", Integer.parseInt(prodNum));
			List<Map> vo = b_P003_D001productService.selectProductInfo(info); //상품내용
			mav.addObject("prodDetail", vo);     //상품정보
			mav.addObject("quantity", info.get("quantity"));   //상세페이지에서 선택한 수량
			
			
			   
		}else if (type.equals("3")) {// 장바구니 물건 결제           ///////////////////////////////////////////////작업중
			
			System.out.println("장바구니 구매");
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
			select.put("type", type);
			int total = b_P003_D001productService.CartTotal(select);
			Paging page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			select.put("start", page.getStart());
			select.put("end", page.getEnd());
			
			List<Map> list = b_P003_D001productService.CartList(select);
			mav.addObject("cartList", list);
			mav.addObject("paging", page);
		}
		
		mav.addObject("type",type);
		mav.setViewName("/shoppingMall/payTest");
		return mav;
	}
	
	
	//@Transactional(propagation = Propagation.REQUIRED)
	@Override
	@RequestMapping(value = "/B_P003_D001/payInfo")
	@ResponseBody
	public String insertPayinfo(@RequestParam Map<String, Object> info,HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> param = new HashMap<String,Object>();
		String result ="ss";
		//유저 번호는 세션에서 꺼내올 예정
		int userNum =1;
		HttpSession session = request.getSession();
		
		// orders / products 테이블에 각각 내용 추가 및 수정
        param.put("userNum",userNum);
        param.put("prodNum", Integer.parseInt((String) info.get("prodNum")));
        param.put("quantity", Integer.parseInt((String) info.get("quantity")));
        param.put("price",Integer.parseInt((String) info.get("paid_amount")));
        param.put("prodName",info.get("prodName"));
        param.put("chooseAddress",info.get("chooseAddress"));
        param.put("address1",info.get("address1"));
        param.put("address2",info.get("address2"));
        param.put("custName",info.get("custName"));
        param.put("paid_amount",Integer.parseInt((String) info.get("paid_amount")));
        param.put("zoneCode",Integer.parseInt((String) info.get("zoneCode")));
        param.put("phoneNum",Integer.parseInt((String) info.get("phoneNum")));
        param.put("payType",info.get("payType"));
        param.put("imp_uid",info.get("imp_uid"));
        param.put("merchant_uid",info.get("merchant_uid"));
        param.put("point",Integer.parseInt((String) info.get("point")));	
        param.put("apply_num", info.get("apply_num"));
        
        try {
        	b_P003_D001productService.updateQuantity(param); //수량 수정
        	b_P003_D001productService.updateOrders(param);    // 장바구니추가
        	b_P003_D001productService.delivery(param);       //배송지 추가
        	b_P003_D001productService.updatePoint(param);    // 포인트 차감
        	b_P003_D001productService.insertPayment(param);   // 지불수단 추가
        	//b_P003_D001productService.insertPaymentTest(param);
        	
		} catch (Exception e) {
           e.printStackTrace();
		}
		return result;
       
        
        // delivery에 내용 추가    기본일경우 수정  no  변경지의 경우 추가
        // point 테이블에 사용한 만큼 차감
        //payment에 내용 추가
	}
	
	
	@Override            //장바구니에 추가
	@RequestMapping(value = "/B_P003_D001/addCart")
	public void addCart(@RequestParam Map<String,Object> info, HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ModelAndView mav = new ModelAndView(); //파라미터에 prodNum , quantity,prodName 있다
		Map<String,Object> param = new HashMap<String,Object>();
		//세션있다는 가정
		int userNum =1;
		param.put("userNum", userNum);
		 param.put("prodName", info.get("prodName"));
		 param.put("prodNum",Integer.parseInt((String) info.get("prodNum")));
		 param.put("quantity",Integer.parseInt((String) info.get("quantity")));
		 param.put("prodPrice",Integer.parseInt((String) info.get("prodPrice")));
		 b_P003_D001productService.addCart(param);
	}
	


	@Override          //장바구니 상품 중복체크            (보류)
	@RequestMapping(value = "/B_P003_D001/checkCart")
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
	@RequestMapping(value = "/B_P003_D001/getSession")
	@ResponseBody
	public Map<String,Object> getSession(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//세션에서 아이디 정보를 꺼내온다
		Map<String,Object> param = new HashMap<String,Object>();
		int userNum =1;
		param.put("userNum", userNum);
		return param;
	}


	@Override           //장바구니
	@RequestMapping(value = "/B_P003_D001/cartList")
	public ModelAndView cartList(@RequestParam Map<String, Object> info,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView(); //파라미터에 prodNum , quantity,prodName 있다
		Map<String,Object> map = new HashMap<String,Object>();
		//세션에서 아이디 정보를 꺼내온다
		int userNum =1;
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
		
		map.put("userNum", userNum);
		int total = b_P003_D001productService.CartTotal(map);
		Paging page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		
		List<Map> list = b_P003_D001productService.CartList(map);
		
		
		
		mav.addObject("cartList", list);
		mav.addObject("paging", page);
		mav.setViewName("/shoppingMall/cart");
		return mav;
	}


	@Override
	@ResponseBody
	@RequestMapping(value = "/B_P003_D001/deleteCart")
	public void deleteCart(@RequestParam Map<String, Object> info, HttpServletRequest req, HttpServletResponse res) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		//세션에서 값 뽑아올것
		int userNum =1;
		map.put("userNum", userNum);
		map.put("prodNum",Integer.parseInt((String) info.get("deleteNum")));
		b_P003_D001productService.deleteCart(map);
	}


	@Override
	@ResponseBody             //장바구니 선택한 상품 배열로 가져오는 메소드
	@RequestMapping(value = "/B_P003_D001/butProductsFromCart")
	public String buyProductsFromCart(@RequestParam(value = "totalPrice[]") List<Integer> totalPrice,
			@RequestParam(value = "orderNums[]")List<Integer> orderNums,@RequestParam(value = "quantities[]")List<Integer> quantities,
			HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String result="";
		int userNum = 1; //세션에서 꺼내기
		System.out.println("합계:"+totalPrice.get(0));
		System.out.println("주문번호:"+orderNums.get(0));
		System.out.println("수량:"+quantities.get(0));
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO vo;
		for(int i=0; i<totalPrice.size(); i++) {
			vo = new OrdersVO();  //new를 ㅎ
			vo.setUserNum(userNum);
			vo.setPrice(totalPrice.get(i));
			vo.setOrderNum(orderNums.get(i));
			vo.setQuantity(quantities.get(i));
			System.out.println("값체크:"+orderNums.get(i));
			list.add(vo);
		}
		try {
			b_P003_D001productService.modifyBeforeBuy(list);
			result="success";
		} catch (Exception e) {
             e.printStackTrace();
             result="fail";
		}
		return result;
	}


	
	@Override            //중고물품 등록
	@RequestMapping(value = "/E_P002_D003/addUsedPro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addUsedProduct(MultipartHttpServletRequest upfile,HttpServletRequest request, HttpServletResponse response) throws Exception {
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
	        originalFileExtension = files.get(i).getOriginalFilename().substring(originalFileName.lastIndexOf("."));
	        storedFileName = getRandomString() + originalFileExtension;   //위에 랜덤값을 뽑아주는 매소드 + 
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
	}


	@Override
	@RequestMapping(value = "/E_P003_D001/addUsedForm", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/shoppingMall/applyUsedPro");
		return mav;
	}
	
}

