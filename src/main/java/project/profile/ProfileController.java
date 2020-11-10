package project.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProfileController {

    @Resource
    private ProfileService profileService;

    @GetMapping("profile/{userId}")
    public ModelAndView selectUserProfileById(@PathVariable("userId")String userId, HttpSession httpSession){
        ModelAndView mav = new ModelAndView("detail");

        Map map = profileService.selectUserProfileById(userId);
       
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("userId", (String) httpSession.getAttribute("LOGIN"));
        m.put("followId", userId);
        int followBoth = profileService.countFollowBoth(m);
        int followStatus = profileService.countFollowStatus(m);
        mav.addObject("userInfo",map);
        mav.addObject("followBoth", followBoth);
        mav.addObject("followStatus", followStatus);

        return mav;
    }
    
    @Transactional
	@GetMapping(value ="/profile/insertUserFollow.do")
	@ResponseBody
	public int insertUserFollow(@RequestParam String userId, @RequestParam String followId,  HttpServletRequest request, HttpServletResponse response) throws Exception{
	Map<String, Object> map = new HashMap<String, Object>();
	  map.put("userId", userId);
      map.put("followId", followId);
      int rst =  profileService.insertUserFollow(map);
  	return rst;
	}
    
    @Transactional
	@GetMapping(value ="/profile/deleteUserFollow.do")
	@ResponseBody
	public int deleteUserFollow(@RequestParam String userId, @RequestParam String followId,  HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		  map.put("userId", userId);
	      map.put("followId", followId);
	      int rst = profileService.deleteUserFollow(map);
		return rst;
	}
    
    
    @RequestMapping("/profile/myFriendsList.do/{userId}")
    public ModelAndView myFriendsList(@PathVariable("userId") String userId, HttpSession httpSession){
        ModelAndView mav = new ModelAndView("myFriendsList.jsp");

        List<Map> followingList = profileService.selectFollowingList(userId);
        List<Map> followerList = profileService.selectFollowerList(userId);
        Map<String, Object> followCnt = profileService.selectFollowCnt(userId);
       
        mav.addObject("followingList", followingList);
        mav.addObject("followerList", followerList);
        mav.addObject("followCnt", followCnt);
        mav.setViewName("/profile/myFriendsList");

        return mav;
    }
    
}
