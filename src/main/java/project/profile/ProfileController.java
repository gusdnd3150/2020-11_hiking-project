package project.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Map;

@Controller
public class ProfileController {

    @Resource
    private ProfileService profileService;

    @GetMapping("profile/{userId}")
    public ModelAndView selectUserProfileById(@PathVariable("userId")String userId){
        ModelAndView mav = new ModelAndView("detail");

        Map map = profileService.selectUserProfileById(userId);

        mav.addObject("userInfo",map);

        return mav;
    }
}
