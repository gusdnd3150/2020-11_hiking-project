package project.groupmulti.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface GroupMultiController {
    //임시 메소드 (Get)
    @GetMapping
    String example();

    @PostMapping("/uploadContent")
    String uploadContent(@RequestParam("content") MultipartFile file) throws IOException;
}
