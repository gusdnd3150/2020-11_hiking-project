package project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.controller.GroupController;

@Controller
public class HomeController {

	@Autowired
	GroupController groupController;
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mav) {
		mav.setViewName("home.jsp");
		mav.addObject("list", groupController.test());
		return mav;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminHome() {
		return "admin_home.jsp";
	}
}
