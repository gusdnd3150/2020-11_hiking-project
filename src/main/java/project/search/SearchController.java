package project.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.GroupService;
import project.groupmedia.GroupMediaService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class SearchController {

    @Resource(name = "groupService")
    private GroupService groupService;

    @GetMapping("/search.do")
    @ResponseBody
    public List selectGroupsByKeyword(@RequestBody Map map){
        ModelAndView mav = new ModelAndView("/group/search");

        System.out.println(map.toString());

//        List<Map> group = groupService.selectGroupsByKeyword(keyword);


//        mav.addObject("result", result); // 건수
//        mav.addObject("group", group);     // 그룹검색결과
        return null;
    }


}
