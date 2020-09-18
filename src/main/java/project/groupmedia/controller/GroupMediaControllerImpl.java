package project.groupmedia.controller;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import project.group.vo.GroupVO;
import project.groupmedia.service.GroupMediaService;
import project.groupmedia.vo.GroupMediaVO;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class GroupMediaControllerImpl implements GroupMediaController {

    @Autowired
    GroupMediaVO groupMediaVO;
    @Autowired
    GroupMediaService groupMultiService;

    @Override
    @PostMapping("/group/media/insert")
    public String insertGroupMedia(@RequestBody GroupMediaVO vo, @RequestParam("content") MultipartFile file) throws IOException {
        vo.setContent(file.getBytes());
        groupMultiService.insertGroupMedia(groupMediaVO);
        return "group/result.html";
    }

    @Override
    @PostMapping("/group/media/list")
    @ResponseBody
    public List<GroupMediaVO> selectGroupMediaList() throws Exception {
        List<GroupMediaVO> list = groupMultiService.selectGroupMediaList();

//        for(GroupMediaVO vo : list){
//            byte[] encodedBytes = Base64.encodeBase64(vo.getContent());
//            vo.setContent(encodedBytes);
//        }
        return list;
    }


    @PostMapping("/group/media/{groupNum}")
    public void selectGroupMediaOne(@PathVariable("groupNum") int groupNum,
                                    HttpServletResponse response,
                                    HttpServletRequest request) throws Exception{
        InputStream is = null;
        byte[] bytes;

        String content_type = "image/jpeg";
        response.setContentType(content_type);

        bytes = groupMultiService.selectGroupMediaOne(groupNum);

    }
}