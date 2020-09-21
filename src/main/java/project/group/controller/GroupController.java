package project.group.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.vo.GroupVO;

import java.util.List;
import java.util.Map;

public interface GroupController {

    @GetMapping("/group")
    ModelAndView groupPage(ModelAndView mav);

    @ResponseBody
    @PostMapping("/group")
    Map insertGroup(@RequestBody GroupVO groupVO) throws Exception;

    @GetMapping("/group/lists")
    String printGroupList();

    @ResponseBody @PostMapping("/groupList")
    ModelAndView selectGroup(@RequestParam("groupName") String groupName)throws Exception;

    @ResponseBody @PostMapping("/group/update")
    void updateGroup(@RequestBody GroupVO groupVO) throws Exception;

    @ResponseBody @PostMapping("/group/delete")
    void deleteGroup(@RequestParam("groupNum") int groupNum) throws Exception;

    List<GroupVO> test();
}
