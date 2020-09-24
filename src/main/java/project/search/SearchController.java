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

    @PostMapping("/search")
    public ModelAndView selectGroupsByKeyword(@RequestParam("keyword") String keyword){
        ModelAndView mav = new ModelAndView("/group/search");
        List<Map> group = groupService.selectGroupsByKeyword(keyword);

        int result = 0;

        if(!group.isEmpty()){
            result = group.size();
        }

        mav.addObject("result", result); // 건수
        mav.addObject("group", group);     // 그룹검색결과

        return mav;
    }


}
