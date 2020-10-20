package project.after;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Controller
public class AfterController {

    @Resource(name = "afterService")
    private AfterService afterservice;

    @PostMapping("/after/insert.do")
    public void insertAfter(@RequestParam Map map){
        afterservice.insertAfter(map);
    }

    @PostMapping("/after/uploadImage.do")
    @ResponseBody
    public String insertImage(@RequestParam("upload")MultipartFile file, HttpServletRequest request) {

        String storedFileName = null;
        String realPath = null;
        String tempPath = null;
        try {
            realPath = request.getSession().getServletContext().getRealPath("/");
            tempPath = "/upload/";
            storedFileName = uploadTempImg(realPath, file);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "{\"url\":\"" + tempPath + storedFileName + "\"}";

    }

    public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

    public String uploadTempImg(String realPath, MultipartFile file) throws IOException {

        String requestPath = realPath;
        String tempImagePath = "upload/";
        String savePath = requestPath + tempImagePath;

        File f = new File(savePath);
        if(f.exists() == false){
            f.mkdirs();
        }

        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        originalFileName = file.getOriginalFilename();
        originalFileExtension = file.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
        storedFileName = getRandomString() + originalFileExtension;

        f = new File(savePath + storedFileName);

        file.transferTo(f);

        return storedFileName;
    }

}
