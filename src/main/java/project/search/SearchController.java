package project.search;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.GroupService;
import project.groupmedia.GroupMediaService;
import project.mountain.MountainItemDTO;
import project.mountain.MountainResponseVO;
import project.mountain.MountainService;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
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
                               @RequestParam("keyword")String keyword) throws UnsupportedEncodingException {

        Map resultMap = new HashMap();

        Map searchMap = new HashMap();
        searchMap.put("type",type);
        searchMap.put("period",period);
        searchMap.put("sort",sort);
        searchMap.put("keyword",keyword);

        // 검색어 저장
        searchService.saveKeyword(searchMap);

        // 결과 리스트 선언
        List<MountainItemDTO> mountainList = new ArrayList<>();
        List trailList = new ArrayList();
        List moimList = new ArrayList();

        // 산 검색
        try{
            if(type.equals("none")||type.equals("mt")){
                MountainResponseVO vo = mountainService.get100MountainInfo(keyword, "");
                List<MountainItemDTO> mountainInfo = vo.getBody().getItems();
                if(mountainInfo!=null){
                    for(int i=0;i<mountainInfo.size();i++){
                        mountainList.add(mountainInfo.get(i));
                    }
                }
            }

            // 등산로 검색
            if(type.equals("none")||type.equals("trail")){
                trailList = searchService.searchKeywordTrail(searchMap);
            }

            // 그룹 검색
            List groupList = new ArrayList();
            if(type.equals("none") || type.equals("group")){
                groupList = searchService.searchKeywordGroup(searchMap);
            }

            // 모임 검색
            if(type.equals("none") || type.equals("moim")){
                moimList = searchService.searchKeywordMoim(searchMap);
            }

            resultMap.put("mountainList",mountainList);
            resultMap.put("trailList",trailList);
            resultMap.put("groupList",groupList);
            resultMap.put("moimList",moimList);

        }catch (Exception e){
            e.printStackTrace();
        }

        return resultMap;
    }

    @GetMapping("/search/suggestion.do")
    @ResponseBody
    public List suggestion(@RequestParam("keyword")String keyword){
        return searchService.suggestion(keyword);
    }

    @GetMapping("/search/rank.do")
    @ResponseBody
    public List selectKeywordRank(){
        return searchService.selectKeywordRank();
    }

    @GetMapping("/search/mainKeywordSearch.do")
    @ResponseBody
    public List mainKeywordSearch(@RequestParam("keyword")String keyword,
                                  @RequestParam("rowNum")int rowNum){
        Map map = new HashMap();
        map.put("keyword",keyword);
        map.put("rowNum",rowNum);
        return searchService.mainKeywordSearch(map);
    }
}
