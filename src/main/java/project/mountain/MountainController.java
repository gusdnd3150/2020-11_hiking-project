package project.mountain;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class MountainController {

    @Value("${mountainImagePath}")
    private String mountainImagePath;

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

    @GetMapping("/mountain/{searchWrd}.do")
    @ResponseBody
    public ModelAndView getMountainInfo(@PathVariable("searchWrd")String searchWrd,
                                        @RequestParam("userId")String userId) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView("/mountain/detail");
        MountainResponseVO vo = mountainService.getMountainInfo(searchWrd);

        List<MountainItemDTO> list = new ArrayList<>();
        for(int i=0;i<vo.getBody().getItems().size();i++){
            MountainItemDTO dto = new MountainItemDTO();
            dto = vo.getBody().getItems().get(i);
            String mntilistno = vo.getBody().getItems().get(i).getMntilistno();
            Map map = new HashMap();
            map.put("mntilistno",mntilistno);
            map.put("userId",userId);
            dto.setLikeYN(mountainService.checkMtLike(map));
            dto.setCountLike(mountainService.followMountainCount(mntilistno));
            list.add(dto);

//            MountainResponseVO vo2 = mountainService.getMountainImage(mntilistno);

//            List<String> list2 = new ArrayList<>();
//            for(int j=0;j<vo2.getBody().getItems().size();j++){
//                list2.add(vo2.getBody().getItems().get(j).getImgfilename());
//                list.add(list2);
//            }
        }


        mav.addObject("searchWrd",searchWrd);
        mav.addObject("mountain",list);

        return mav;
    }

    @PostMapping("/searchMtImage.do")
    public MountainResponseVO mountainImage(@RequestParam("mntilistno")String mntilistno) throws UnsupportedEncodingException {

        MountainResponseVO vo = mountainService.getMountainImage(mntilistno);

        return vo;
    }

    @GetMapping("/mountain/sub-detail/{mtNm}")
    public ModelAndView mountainDetail(@PathVariable("mtNm")String mtNm) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView("/mountain/sub-detail");
        MountainResponseVO vo = mountainService.get100MountainInfo(mtNm,"");
        List<MountainItemDTO> list = new ArrayList<>();
        for(int i=0;i<vo.getBody().getItems().size();i++){
            list.add(vo.getBody().getItems().get(i));
        }
        mav.addObject("mountain",list);
        return mav;
    }

    // 산 인기 랭킹
    @GetMapping("/mountain/rank.do")
    @ResponseBody
    public List selectMountainByRank(int rowNum){
        return mountainService.selectMountainByRank(rowNum);
    }

//    @GetMapping("/mountain/{mntiname}.do")
    public ModelAndView mountainDetail1(@PathVariable("mntiname") String mntiname) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("detail");
        MountainResponseVO mountainVO = mountainService.getMountainInfo(mntiname);

        // 등산로 상세사진 1개만
//        for(int i=0;i<mountainVO.getBody().getItems().size();i++) {
        MountainResponseVO imageVO = mountainService.getMountainImage(mountainVO.getBody().getItems().get(0).getMntilistno());
//            System.out.println(imageVO.toString());
//        }

        MountainItemDTO dto = mountainVO.getBody().getItems().get(0);//이거 고쳐야함 이름 겹치는산이 있다
        dto.setImgfilename(mountainImagePath+imageVO.getBody().getItems().get(0).getImgfilename());

        mav.addObject("mtInfo",dto);

        return mav;
    }

    @PostMapping("/mountain/followFN.do")
    @ResponseBody
    public int followMountainFunction(@RequestBody Map map){
        int result = mountainService.followMountainFunction(map);
        return result;
    }

}
