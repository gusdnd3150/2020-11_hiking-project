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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Controller
public class AfterController {

    @Resource(name = "afterService")
    private AfterService afterService;

    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "groupService")
    private GroupService groupService;

    @GetMapping("/after/main.do")
    public ModelAndView main(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/after/main");
        String userId = (String) request.getSession().getAttribute("LOGIN");
        if(userId!=null){
            String sessionIdImage = groupService.selectSessionIdImage(userId);
            mav.addObject("sessionIdImage",sessionIdImage);
        }

        List<Map> list = afterService.selectAllAfterList();

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

        int userNum = userService.selectUserNum(map.get("userId")+"");

        map.put("userNum",userNum);

        int result = 0;
        int exist = afterService.checkAfterExist(map);
        if(exist!=0){
            return result;
        }
        result = afterService.insertAfter(map);

        return result;
    }

    @GetMapping("/after/{afterNum}.do")
    public ModelAndView afterDetail(@PathVariable("afterNum")int afterNum,
                                    HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/after/main");
        List list = afterService.selectAfterDetail(afterNum);

        String userId = (String) request.getSession().getAttribute("LOGIN");
        if(userId!=null){
            String sessionIdImage = groupService.selectSessionIdImage(userId);
            mav.addObject("sessionIdImage",sessionIdImage);
        }
        mav.addObject("after",list);
        return mav;
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

    @PostMapping("/after/insertComment.do")
    @ResponseBody
    public Map insertCommentAfter(@RequestBody Map map){
        afterService.insertCommentAfter(map);
        return afterService.selectCommentOne((Integer) map.get("commentNum"));
    }

    @PostMapping("/after/insertSubComment.do")
    @ResponseBody
    public Map insertSubComment(@RequestBody Map map){
        afterService.insertCommentAfter(map);
        afterService.updateSubCommentCount(map);
        return afterService.selectCommentOne((Integer) map.get("commentNum"));
    }

    @GetMapping("/after/selectCommentByAfterNum.do")
    @ResponseBody
    public List selectCommentByAfterNum(@RequestParam("afterNum")int afterNum){
        return afterService.selectCommentByAfterNum(afterNum);
    }

    @GetMapping("/after/selectLikeCount.do")
    @ResponseBody
    public int selectLikeCount(@RequestParam("afterNum")int afterNum){
        return afterService.selectLikeCount(afterNum);
    }
    @GetMapping("/after/checkAfterLike.do")
    @ResponseBody
    public int checkAfterLike(@RequestParam("afterNum")int afterNum,
                                 @RequestParam("userId")String userId){
        Map map = new HashMap();
        map.put("afterNum",afterNum);
        map.put("userId",userId);
        return afterService.checkAfterLike(map);
    }

    @PostMapping("/after/insertAfterLike.do")
    @ResponseBody
    public int insertLike(@RequestBody Map map){
        afterService.insertAfterLike(map);
        return afterService.selectLikeCount((Integer)map.get("afterNum"));
    }
    @PostMapping("/after/updateAfterLike.do")
    @ResponseBody
    public int updateAfterLike(@RequestBody Map map){
        afterService.updateAfterLike(map);
        return afterService.selectLikeCount((Integer)map.get("afterNum"));
    }
}
