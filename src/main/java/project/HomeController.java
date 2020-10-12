package project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.GroupController;
import project.group.GroupService;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import javax.annotation.Resource;

@Controller
@EnableSwagger2
public class HomeController {

	@Resource(name = "groupService")
	private GroupService groupService;
	
	@GetMapping("/main.do")
	public ModelAndView home(ModelAndView mav) {
		mav.setViewName("home");
		mav.addObject("group", groupService.selectMainGroupList());
		return mav;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminHome() {
		return "admin_home";
	}
}
