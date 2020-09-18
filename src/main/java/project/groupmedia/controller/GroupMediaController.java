package project.groupmedia.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import project.groupmedia.vo.GroupMediaVO;

import java.io.IOException;

public interface GroupMediaController {

    String insertGroupMedia(@RequestBody GroupMediaVO vo, @RequestParam("content") MultipartFile file) throws IOException;

    @PostMapping("/group/media/{groupNum}")
    @ResponseBody
    ResponseEntity<byte[]> selectGroupMedia(@PathVariable("groupNum") int groupNum) throws Exception;
}