package project.E_P002_D003.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.E_P002_D003.Service.E_P002_D003ProductsService;


@Controller
public class E_P002_D003ProductsControllerImpl  implements E_P002_D003ProductsController{
	private static final Logger logger = LoggerFactory.getLogger(E_P002_D003ProductsControllerImpl.class);
	//private static final String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	
	
	@Autowired
	private E_P002_D003ProductsService e_P002_D003ProductsService;
	
	@Override 
	@RequestMapping(value = "/E_P002_D003/productForm", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("product/productForm");
		return mav;
	}
	
	@RequestMapping(value = "/E_P002_D003/addProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity addProduct(ModelAndView mv,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();//prod 정보를 받음 Map을 선언
		Enumeration enu = request.getParameterNames();  //인풋의 name으로된 정보들을 가져와 반복문을통해 map에 넣어주는 작업
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement(); //name값을 돌면서 String name에 넣는것
			String value = request.getParameter(name);  //넣을 이름을 토대로 값을 받아온 후
			dataMap.put(name, value);                      // map에 하나씩 저장
		}
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");	
		
		try {
				e_P002_D003ProductsService.addProduct(dataMap);// 상품상세내용 추가 
			    RequestDispatcher dispatch = request.getRequestDispatcher("/project/E_P002_D003/saveImage.do");
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/project/E_P002_D003/productForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}	
	
	/*
    @RequestMapping(value ="/getByteImage")
	public ResponseEntity<byte[]> getByteImage(){
		Map<String,Object> map = dao.getByteImage();
		byte[] imageContent = (byte[])map.get("img");
		
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent,headers,HttpStatus.OK);
	}*/
}