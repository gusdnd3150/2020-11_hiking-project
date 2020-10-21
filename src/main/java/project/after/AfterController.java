package project.after;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import project.group.GroupService;
import project.user.service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Controller
public class AfterController {

    @Resource(name = "afterService")
    private AfterService afterservice;

    @Resource(name = "userService")
    private UserService userService;

    @GetMapping("/after/main.do")
    public ModelAndView main(){
        ModelAndView mav = new ModelAndView("/after/main");

        List list = afterservice.selectAllAfterList();

        System.out.println(list.toString());

        mav.addObject("after",list);

        return mav;
    }

    @PostMapping("/after/insertAfter.do")
    @ResponseBody
    public int insertAfter(@RequestBody Map map){
        /*
         임시폴더 -> resources/img 변경 필요
         map.put("content",map.get("content").toString().replace("/upload","/resource/img"));
         */
        System.out.println(map.toString());

        int userNum = userService.selectUserNum(map.get("userId")+"");

        map.put("userNum",userNum);

        int result = 0;
        int exist = afterservice.checkAfterExist(map);
        if(exist!=0){
            return result;
        }
        result = afterservice.insertAfter(map);

        return result;
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
