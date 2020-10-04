package project.mountain;

import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

@RestController
public class MountainController {

    @Resource(name = "mountainService")
    private MountainService mountainService;

    @PostMapping("/searchMt.do")
    public MountainResponseVO mountainList(@RequestBody Map map) throws UnsupportedEncodingException {

        String mtNm = (String) map.get("mtNm");
        String arNm = (String) map.get("arNm");

        MountainResponseVO vo = mountainService.getMountainInfo(mtNm, arNm);

        System.out.println("vo : " + vo.getBody().getItems().get(0));

        System.out.println(vo.toString());

        return vo;

    }

}
