package project.mountain;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

@RestController
public class MountainController {

    @Resource(name = "mountainService")
    private MountainService mountainService;

    // 100대 명산 api (보류)
    @PostMapping("/searchMt.do")
    public MountainResponseVO mountainList1(@RequestBody Map map) throws UnsupportedEncodingException {

        String mtNm = (String) map.get("mtNm");
        String arNm = (String) map.get("arNm");

        MountainResponseVO vo = mountainService.get100MountainInfo(mtNm, arNm);

        return vo;

    }

    @PostMapping("/searchMt2.do")
    public MountainResponseVO mountainList2(@RequestParam("searchWrd")String searchWrd) throws UnsupportedEncodingException {

        MountainResponseVO vo = mountainService.getMountainInfo(searchWrd);

        return vo;
    }

    @PostMapping("/searchMtImage.do")
    public MountainResponseVO mountainImage(@RequestParam("mntilistno")String mntilistno) throws UnsupportedEncodingException {

        MountainResponseVO vo = mountainService.getMountainImage(mntilistno);

        return vo;
    }

    @GetMapping("/mountain/detail/{mtNm}")
    public ModelAndView mountainDetail(@PathVariable("mtNm")String mtNm){
        ModelAndView mav = new ModelAndView("/mountain/detail");

        

        System.out.println("okay mt detail");
        return mav;
    }

}
