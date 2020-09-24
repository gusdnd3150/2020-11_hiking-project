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
    GroupMediaService groupMediaService;

    @PostMapping("/insert.do")
    public String insertGroupMedia(@RequestBody GroupMediaVO vo, @RequestParam("content") MultipartFile file) throws IOException {
        vo.setContent(file.getBytes());
        groupMediaService.insertGroupMedia(groupMediaVO);
        return "";
    }

    @GetMapping("/{groupNum}")
    public ResponseEntity<byte[]> selectGroupMedia(@PathVariable("groupNum") int groupNum) throws Exception {
        byte[] imageContent = groupMediaService.selectGroupMediaOne(groupNum);
        final HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);

        //Base64 Encode
//        for( String content : map.keySet()){
//            byte[] encodedBytes = Base64.encodeBase64();
//            list.add(encodedBytes);
//        }
    }
    @GetMapping("/detail/{groupNum}")
    public List<byte[]> selectGroupMediaDetail(@PathVariable("groupNum") int groupNum) throws Exception {
        System.out.println(groupMediaService.selectGroupMediaDetail(groupNum));
        return null;
    }
}