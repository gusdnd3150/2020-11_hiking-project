package project.B_P003_D001.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class SampleController {
    
	@Autowired
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay() {
        
        return "redirect:" + kakaopay.kakaoPayReady();
    }
    
    @GetMapping("/kakaoPaySuccess")
    public ModelAndView kakaoPaySuccess(@RequestParam("pg_token") String pg_token) {
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("info", kakaopay.kakaoPayInfo(pg_token));
    	mav.setViewName("/shoppingMall/payResult");
    	System.out.println("url"+pg_token);
        //log.info("kakaoPaySuccess get............................................");
        //log.info("kakaoPaySuccess pg_token : " + pg_token);
     return mav;   
    }
    /*@GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        
    }*/
}
 
