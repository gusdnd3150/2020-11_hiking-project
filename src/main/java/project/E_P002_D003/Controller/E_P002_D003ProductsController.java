package project.E_P002_D003.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface E_P002_D003ProductsController {

	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
}