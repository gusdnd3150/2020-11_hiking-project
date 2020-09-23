package project.group;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.groupmedia.GroupMediaService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/group")
public class GroupController{

    @Resource(name = "groupService")
    private GroupService groupService;

    @Resource(name = "groupMediaService")
    private GroupMediaService groupMediaService;

    @PostMapping("/insert.do")
    public void insertGroup(GroupVO vo) throws Exception {
        groupService.insertGroup(vo);
    }

    @GetMapping("/list.do")
    public ModelAndView selectGroupList() throws Exception{
        List<GroupVO> groupList = groupService.selectGroupList();
        ModelAndView mav = new ModelAndView("main");
        mav.addObject("group",groupList);
        return mav;
    }

    @PostMapping("/update.do")
    public void updateGroup(@ModelAttribute GroupVO vo) throws Exception {
        groupService.updateGroup(vo);
    }

    @PostMapping("/delete.do")
    public void deleteGroup(@RequestParam("groupNum") int groupNum) throws Exception {
        groupService.deleteGroup(groupNum);
    }

    @GetMapping("/detail/{groupNum}")
    public ModelAndView groupDetail(@PathVariable("groupNum") int groupNum){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/group/detail");
        Map<String,Object> map = groupService.selectGroupDetail(groupNum);
        mav.addObject("group", map);
        return mav;
    }
}
