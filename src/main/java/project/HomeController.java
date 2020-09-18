package project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "home.jsp";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminHome() {
		return "admin_home.jsp";
	}
}
