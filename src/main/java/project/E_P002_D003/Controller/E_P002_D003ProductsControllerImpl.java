package project.E_P002_D003.Controller;

import java.io.File;

import java.io.IOException;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.Paging;
import project.E_P002_D003.Service.E_P002_D003ProductsService;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;



@Controller
public class E_P002_D003ProductsControllerImpl  implements E_P002_D003ProductsController{
	private static final Logger logger = LoggerFactory.getLogger(E_P002_D003ProductsControllerImpl.class);
	//private static final String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	
	@Autowired
	private E_P002_D003ProductsService e_P002_D003ProductsService;
	
	@Override 
	@RequestMapping(value = "/E_P002_D003/productForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/product/productForm");
		return mav;
	}

	@Override
	@RequestMapping(value = "/E_P002_D003/addProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addProduct(MultipartHttpServletRequest file,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> dataMap = new HashMap<String, Object>();//prod 정보를 받음 Map을 선언
		
		Enumeration enu = request.getParameterNames();  //인풋의 name으로된 정보들을 가져와 반복문을통해 map에 넣어주는 작업
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement(); //name값을 돌면서 String name에 넣는것
			String value = request.getParameter(name);  //넣을 이름을 토대로 값을 받아온 후
			dataMap.put(name, value);                      // map에 하나씩 저장
		}
		
		List<MultipartFile> test = file.getFiles("CONTENTImage"); //인풋의 파일들 정보
		List<E_P002_D003PhotoVO> imageFileList = new ArrayList<E_P002_D003PhotoVO>(); //맵에 추가할 정보들
		Map articleMap = new HashMap();
		
		for(int i=0;i<test.size();i++) {
			E_P002_D003PhotoVO vo =new E_P002_D003PhotoVO();
			vo.setContent(test.get(i).getBytes());
			vo.setpPhotoNum(i+1);
			imageFileList.add(vo);
			System.out.println("파일정보"+vo.getContent());
		}
		articleMap.put("imageFileList",imageFileList);
		
		mav.setViewName("/product/productForm");
		try {
				e_P002_D003ProductsService.addProduct(dataMap);// 상품상세내용 추가
				e_P002_D003ProductsService.saveImage(articleMap); //이미지 추가
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return mav;
	}

	
	


}