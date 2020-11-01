package project.B_P002_D001.Controller;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.Paging;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;

public interface B_P002_D001Controller {
     public ModelAndView shopmainCate(@RequestParam Map<String, Object> info,HttpSession httpSession,HttpServletRequest request, HttpServletResponse response)throws Exception;  
     //public ModelAndView searchResult(@RequestParam Map<String, Object> info,HttpServletRequest request, HttpServletResponse response)throws Exception;

     
     //////////////아래 메소드 처리////////////////
     
     
     /*public ResponseEntity<byte[]> getByteImage(@PathVariable("num") int num,HttpServletRequest req, HttpServletResponse res)throws Exception;*/
}

