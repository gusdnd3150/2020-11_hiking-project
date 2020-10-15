package project.commu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.groupmedia.GroupMediaService;

@Controller
@RequestMapping("/commu/*")
public class CommuController {
	
	public static final Logger logger = LoggerFactory.getLogger(CommuController.class);
	private static final String LOGIN = "LOGIN";
	
	 @Value("${mountainImagePath}")
	    private String mountainImagePath;

	 @Autowired
	    private CommuService commuService;

	 @Autowired
	    private GroupMediaService groupMediaService;

//	 @Autowired
//	    private MountainService mountainService;

	 	@Transactional
	    @PostMapping(value = "/insert.do")
	    @ResponseBody
	    public void insertGroup(@RequestParam Map map,
	                            @RequestParam(value = "file", required = false) List<MultipartFile> files,
	                           HttpServletRequest request) throws Exception {

	    	System.out.println(map);
	    	commuService.insertGroup(map);

	        String path = request.getSession().getServletContext().getRealPath("/");
	        System.out.println("두루"+ path);
	        int groupNum = (int) map.get("groupNum");
	        groupMediaService.insertGroupMedia(groupNum,files,path);
	    }

	    @GetMapping("/commuMainView.do")
	    public ModelAndView commuMainView(){
	        ModelAndView mav = new ModelAndView("commuMain");
	        List<Map> list = commuService.selectAllGroupList();
	        mav.addObject("commu",list);
	        return mav;
	    }
	    
	    @RequestMapping(value ="/commuPageView.do")
	    public ModelAndView commuPageView(@RequestParam("groupNum") int groupNum, HttpSession httpSession) throws Exception{
	        ModelAndView mav = new ModelAndView("commuPage");
			if(groupNum == 0) {
				mav.setViewName("redirect:/commu/commuMain.do");
			}else {
				Map<String, Object> map = new HashMap<String, Object>();
				String id = (String) httpSession.getAttribute(LOGIN);
				map.put("id",id);
				map.put("groupNum", groupNum);
				List<Map> list = commuService.selectCommuPageInfo(map);
				int i =1;
				for(Map m: list) {
					String s = "m"+i;
					System.out.println(s +">>>>>"+m);
					mav.addObject(s, m);
					i++;
				}
			}
	        return mav;
	    }
	    
	    
	    
	    

}
