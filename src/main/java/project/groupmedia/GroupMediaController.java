//package project.groupmedia;
//
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//import project.common.FileUtils;
//
//import javax.annotation.Resource;
//import java.io.IOException;
//import java.util.List;
//import java.util.Map;
//
//@Controller
//@RequestMapping("/group/media")
//public class GroupMediaController {
//
//    @Resource(name = "groupMediaService")
//    private GroupMediaService groupMediaService;
//
//    public int insertGroupMedia(int groupNum, List<MultipartFile> files){
//        System.out.println("groupMediaController");
//        //groupMediaService.insertGroupMedia(map);
//        return 0;
//    }
//
//    @GetMapping("/{groupNum}")
//    public ResponseEntity<byte[]> selectGroupMedia(@PathVariable("groupNum") int groupNum){
//        byte[] imageContent = groupMediaService.selectGroupMediaOne(groupNum);
//        final HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.IMAGE_PNG);
//        return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
//
//    }
//    @GetMapping("/detail/{groupNum}")
//    public List<byte[]> selectGroupMediaDetail(@PathVariable("groupNum") int groupNum){
//        return groupMediaService.selectGroupMediaDetail(groupNum);
//    }
//}