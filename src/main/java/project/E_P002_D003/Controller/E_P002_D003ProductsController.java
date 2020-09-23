package project.E_P002_D003.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.Paging;

public interface E_P002_D003ProductsController {
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
    public ModelAndView addProduct(MultipartHttpServletRequest file,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
