package project.group.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.service.GroupService;
import project.group.vo.GroupVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class GroupControllerImpl implements GroupController{

    @Autowired
    GroupVO groupVO;

    @Autowired
    GroupService groupService;

    @Override
    @GetMapping("/group")
    public ModelAndView groupPage(ModelAndView mav){
        mav.setViewName("group/groupMain.jsp");
        mav.addObject("list", test());
        return mav;
    }

    @Override
    @ResponseBody
    @PostMapping("/group/new")
    public Map insertGroup(@RequestBody GroupVO groupVO) throws Exception {
        Map map = new HashMap();

        int result = groupService.insertGroup(groupVO);

        if(result==1){
            map.put("result", 1);
            map.put("message", "insert 성공");
        }
        return map;
    }

    @Override
    @GetMapping("/group/lists")
    public String printGroupList(){
        return "groupMain.jsp";
    }

    @Override
    @ResponseBody @PostMapping("/groupList")
    public ModelAndView selectGroup(@RequestParam("groupName")String groupName)throws Exception{
        Map<String, Object> searchMap = new HashMap<String, Object>();
        searchMap.put("groupName",groupName);

        List<GroupVO> list = groupService.selectGroup(searchMap);

        ModelAndView mav = new ModelAndView("groupMain.jsp");
        mav.addObject("selectList", list);
        return mav;
    }

    @Override
    @ResponseBody @PostMapping("/group/update")
    public void updateGroup(@RequestBody GroupVO groupVO) throws Exception {
//        Map<String, Object> updateMap = new HashMap<String, Object>();
//        updateMap.put("updateMap", userInfo);

        groupService.updateGroup(groupVO);
        //여기 try-catch 돌려서 http 응답코드 같이 return 하기
    }

    @Override
    @ResponseBody @PostMapping("/group/delete")
    public void deleteGroup(@RequestParam("groupNum") int groupNum) throws Exception {
        Map<String, Object> deleteMap = new HashMap<String, Object>();
        deleteMap.put("groupNum",groupNum);

        groupService.deleteGroup(deleteMap);
    }

    @Override
    @RequestMapping("/test")
    public List<GroupVO> test(){
        List<GroupVO> list = groupService.test();
        return list;
    }
}
