package project.groupmedia;

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
import project.group.GroupVO;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/group/media")
public class GroupMediaController {

    @Resource(name = "groupMediaService")
    GroupMediaService groupMediaService;

    @PostMapping("/insert.do")
    @ResponseBody
    public String insertGroupMedia(@RequestParam("content") MultipartFile file) throws IOException, SQLException {
        Blob blob = new javax.sql.rowset.serial.SerialBlob(file.getBytes());
        System.out.println(file.getContentType());
//        System.out.println(blob.);
//        groupMediaService.insertGroupMedia();
        return "";
    }

    @GetMapping("/{groupNum}")
    public ResponseEntity<byte[]> selectGroupMedia(@PathVariable("groupNum") int groupNum){
        byte[] imageContent = groupMediaService.selectGroupMediaOne(groupNum);
        final HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);

    }
    // 여기부터
    @GetMapping("/detail/{groupNum}")
    public List<byte[]> selectGroupMediaDetail(@PathVariable("groupNum") int groupNum){
        return groupMediaService.selectGroupMediaDetail(groupNum);
    }
}