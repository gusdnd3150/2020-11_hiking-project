package project.groupmedia.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import project.groupmedia.vo.GroupMediaVO;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface GroupMediaController {

    String insertGroupMedia(@RequestBody GroupMediaVO vo, @RequestParam("content") MultipartFile file) throws IOException;

    @PostMapping("/group/media/list")
    @ResponseBody
    List<GroupMediaVO> selectGroupMediaList() throws Exception;
}
