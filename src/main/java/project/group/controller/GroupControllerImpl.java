package project.group.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import project.group.service.GroupService;
import project.group.vo.GroupVO;

@Slf4j
@Controller
public class GroupControllerImpl implements GroupController{

    @Autowired
    GroupVO groupVO;

    @Autowired
    GroupService groupService;

    @Override
    @GetMapping("group")
    public String groupPage(){
        return "group/group.html";
    }

    @Override
    @ResponseBody @PostMapping("/group")
    public String insertGroup(@RequestBody GroupVO groupVO) throws Exception {

        int result = groupService.insertGroup(groupVO);

        return "insertGroup OK";
    }
}
