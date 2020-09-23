package project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.GroupController;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Controller
@EnableSwagger2
public class HomeController {

	@Autowired
	GroupController groupController;
	
	@GetMapping("/main.do")
	public ModelAndView home(ModelAndView mav) {
		mav.setViewName("/home");
		mav.addObject("list", groupController.test());
		return mav;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminHome() {
		return "admin_home";
	}
}
