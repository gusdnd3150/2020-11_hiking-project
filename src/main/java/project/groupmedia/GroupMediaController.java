package project.groupmedia;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/group/media")
public class GroupMediaController {

    @Autowired
    GroupMediaVO groupMediaVO;
    @Autowired
    GroupMediaService groupMultiService;

    @PostMapping("/insert.do")
    public String insertGroupMedia(@RequestBody GroupMediaVO vo, @RequestParam("content") MultipartFile file) throws IOException {
        vo.setContent(file.getBytes());
        groupMultiService.insertGroupMedia(groupMediaVO);
        return "";
    }

    @RequestMapping("/{groupNum}")
    public ResponseEntity<byte[]> selectGroupMedia(@PathVariable("groupNum") int groupNum) throws Exception {
        Map<String,Object> map = groupMultiService.selectGroupMediaOne(groupNum);

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
}