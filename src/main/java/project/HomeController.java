package project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@GetMapping("/api/hello")
	public String hello() {
		return "안녕하세요. 현재 서버시간은 " +new Date() + "입니다. \n";
	}
	
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(){
		return "user/login.html";
	}
}
