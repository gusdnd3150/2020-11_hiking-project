package project.group.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import project.group.vo.GroupVO;

public interface GroupController {

    @GetMapping("group")
    String groupPage();

    @ResponseBody
    @PostMapping("/group")
    String insertGroup(@RequestBody GroupVO groupVO) throws Exception;
}
