package project.group;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller("/group")
public class GroupController{

    @Resource(name = "groupService")
    private GroupService groupService;

    @ResponseBody
    @PostMapping("/group/new")
    public Map insertGroup(@RequestBody GroupVO groupVO) throws Exception {
        Map map = new HashMap();

        groupService.insertGroup(groupVO);

        return map;
    }

    @ResponseBody
    @PostMapping("/groupList")
    public ModelAndView selectGroup(@RequestParam("groupName")String groupName)throws Exception{
        Map<String, Object> searchMap = new HashMap<String, Object>();
        searchMap.put("groupName",groupName);

        List<GroupVO> list = groupService.selectGroup(searchMap);

        ModelAndView mav = new ModelAndView("groupMain.jsp");
        mav.addObject("selectList", list);
        return mav;
    }

    @ResponseBody
    @PostMapping("/group/update")
    public void updateGroup(@RequestBody GroupVO groupVO) throws Exception {
        groupService.updateGroup(groupVO);
    }

    @ResponseBody
    @PostMapping("/group/delete")
    public void deleteGroup(@RequestParam("groupNum") int groupNum) throws Exception {
        groupService.deleteGroup(groupNum);
    }

    @RequestMapping("/test")
    public List<GroupVO> test(){
        List<GroupVO> list = groupService.test();
        return list;
    }

    @GetMapping("/group/{groupNum}")
    public String groupDetail(@PathVariable("groupNum")int groupNum){
        return "";
    }
}
