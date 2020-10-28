package project.search;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.GroupService;
import project.groupmedia.GroupMediaService;
import project.mountain.MountainService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SearchController {

    @Resource(name = "searchService")
    private SearchService searchService;

    @Resource(name = "mountainService")
    private MountainService mountainService;

    @GetMapping("/search.do")
    @ResponseBody
    public Map searchKeyword(@RequestParam("type")String type,
                               @RequestParam("period")String period,
                               @RequestParam("sort")String sort,
                               @RequestParam("keyword")String keyword){

        Map resultMap = new HashMap();

        Map searchMap = new HashMap();
        searchMap.put("type",type);
        searchMap.put("period",period);
        searchMap.put("sort",sort);
        searchMap.put("keyword",keyword);


        System.out.println(searchMap.toString());

        switch (type){
            case "mt":break;
            case "path":break;
            case "group":break;
            case "moim":break;
            case "none":break;
        }
        List groupList = new ArrayList();
        if(type.equals("none") || type.equals("group") || type.equals("moim")){
            groupList = searchService.searchKeyword(searchMap);
        }

        resultMap.put("groupList",groupList);


//        mav.addObject("result", result); // 건수
//        mav.addObject("group", group);     // 그룹검색결과
        return resultMap;
    }


}
