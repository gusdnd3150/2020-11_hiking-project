package project.B_P002_D001.Controller;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.Paging;

public interface B_P002_D001Controller {
    //public ModelAndView getimageList(HttpServletRequest request, HttpServletResponse response) throws Exception;
    //public ModelAndView shopmain (HttpServletResponse response,HttpServletRequest reques) throws Exception;
    //String shopmain(Paging vo, String nowPage, String cntPerPage);
	//ModelAndView shopmain(HttpServletResponse response, HttpServletRequest request) throws Exception;  //메인 리스트 일반버전
     public ModelAndView shopmain(HttpServletRequest request, HttpServletResponse response)throws Exception;   //작업중
     public ResponseEntity<byte[]> getByteImage(@PathVariable("num") int num,HttpServletRequest req, HttpServletResponse res)throws Exception;
}
