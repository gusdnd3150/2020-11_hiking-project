package project.groupmulti.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import project.group.vo.GroupVO;
import project.groupmulti.service.GroupMultiService;
import project.groupmulti.vo.GroupMultiVO;

import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class GroupMultiControllerImpl implements GroupMultiController{

    @Autowired
    GroupMultiVO groupMultiVO;
    @Autowired
    GroupMultiService groupMultiService;

    //임시 메소드 (Get)
    @Override
    @GetMapping("/fileupload")
    public String example(){
        return "group/fileupload.html";
    }

    @Override
    @PostMapping("/uploadContent")
    public String uploadContent(@RequestParam("content") MultipartFile file) throws IOException {
        groupMultiVO.setContent(file.getBytes());
        groupMultiService.uploadGroupMulti(groupMultiVO);
        return "group/result.html";
    }
}
