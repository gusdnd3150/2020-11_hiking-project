package project.groupmedia.controller;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import project.groupmedia.service.GroupMediaService;
import project.groupmedia.vo.GroupMediaVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

@Controller
public class GroupMediaControllerImpl implements GroupMediaController {

    @Autowired
    GroupMediaVO groupMediaVO;
    @Autowired
    GroupMediaService groupMultiService;

    @RequestMapping("/group/list")
    public String groupList(){
        return "groupMain.jsp";
    }
    @Override
    @PostMapping("/group/media/insert")
    public String insertGroupMedia(@RequestBody GroupMediaVO vo, @RequestParam("content") MultipartFile file) throws IOException {
        vo.setContent(file.getBytes());
        groupMultiService.insertGroupMedia(groupMediaVO);
        return "group/result.html";
    }

    @Override
    @RequestMapping("/group/media/{groupNum}")
    public ResponseEntity<byte[]> selectGroupMedia(@PathVariable("groupNum") int groupNum) throws Exception {
        Map<String,Object> map = groupMultiService.selectGroupMedia(groupNum);

        byte[] imageContent = (byte[]) map.get("content");
        final HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);

        //Base64 Encode
//        for( String content : map.keySet()){
//            byte[] encodedBytes = Base64.encodeBase64();
//            list.add(encodedBytes);
//        }
    }

    @RequestMapping("/group/media1/{groupNum}")
    public void test(HttpServletRequest req, HttpServletResponse res, @PathVariable("groupNum") int groupNum) throws Exception {
        res.setContentType("image/jpeg");
        Map<String, Object> map = groupMultiService.selectGroupMediaOne(groupNum);
        System.out.println(map.toString());
        byte[] imagefile = null;
        InputStream inl = new ByteArrayInputStream(imagefile);
        IOUtils.copy(inl, res.getOutputStream());
    }


    @PostMapping("/group/media123/{groupNum}")
    public void selectGroupMediaOne(@PathVariable("groupNum") int groupNum,
                                    HttpServletResponse response,
                                    HttpServletRequest request) throws Exception{
        InputStream is = null;
        byte[] bytes;

        String content_type = "image/jpeg";
        response.setContentType(content_type);

//        bytes = groupMultiService.selectGroupMediaOne(groupNum);

    }
}