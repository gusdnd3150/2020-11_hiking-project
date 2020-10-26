package project.mountain;

import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.group.GroupService;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class MountainController {

    @Value("${mountainImagePath}")
    private String MOUNTAIN_IMAGE_PATH;

    @Value("${mountain100ImagePath}")
    private String MOUNTAIN_100_IMAGE_PATH;

    @Resource(name = "mountainService")
    private MountainService mountainService;

    @Resource(name = "groupService")
    private GroupService groupService;


    // 100대 명산 api
    @GetMapping("/mountain/100/{mtNm}.do")
    public ModelAndView get100MountainInfo(@PathVariable("mtNm")String mtNm) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView("/mountain/sub-detail");
        MountainResponseVO vo = mountainService.get100MountainInfo(mtNm,"");
        List<MountainItemDTO> list = new ArrayList<>();
        for(int i=0;i<vo.getBody().getItems().size();i++){
            list.add(vo.getBody().getItems().get(i));
        }
        mav.addObject("mountain",list);
        return mav;
    }
    @GetMapping("/mountain/100/image.do")
    public List get100MountainImage(@RequestParam("mntiListNo")String mntiListNo) throws UnsupportedEncodingException {
        MountainResponseVO vo = mountainService.get100MountainImage(mntiListNo);
        List list = new ArrayList();
        for(int i=0;i<vo.getBody().getItems().size();i++){
            list.add( MOUNTAIN_100_IMAGE_PATH + vo.getBody().getItems().get(i).getImgfilename());
        }

        return list;
    }

    @GetMapping("/mountain/{searchWrd}.do")
    @ResponseBody
    public ModelAndView getMountainInfo(@PathVariable("searchWrd")String searchWrd,
                                        @RequestParam("userId")String userId) throws UnsupportedEncodingException {

        ModelAndView mav = new ModelAndView("/mountain/detail");

        try{
            MountainResponseVO vo = mountainService.getMountainInfo(searchWrd);

            List<MountainItemDTO> list = new ArrayList<>();
            for(int i=0;i<vo.getBody().getItems().size();i++) {
                MountainItemDTO dto = vo.getBody().getItems().get(i);

                String mntilistno = dto.getMntilistno();

                Map map = new HashMap();
                map.put("mntilistno", mntilistno);
                map.put("userId", userId);
                //여기 메소드 1개로 줄이기
                dto.setLikeYN(mountainService.checkMtLike(map));
                dto.setCountLike(mountainService.followMountainCount(mntilistno));

                list.add(dto);

            }

            // 추천 리스트
            Map map = new HashMap();
            map.put("MTNM",searchWrd);
            List recommendList = groupService.recommendGroup(map);

            mav.addObject("searchWrd",searchWrd);
            mav.addObject("recommendList", recommendList);
            mav.addObject("mountain",list);
        }catch (NullPointerException npe){
            return mav;
        }
        return mav;
    }

    @GetMapping("/mountain/image.do")
    public List selectMtImage(@RequestParam("mntilistno")String mntilistno) throws UnsupportedEncodingException {
        MountainResponseVO vo = mountainService.getMountainImage(mntilistno);
        List list = new ArrayList();
        for(int i=0;i<vo.getBody().getItems().size();i++){
            list.add( MOUNTAIN_IMAGE_PATH + vo.getBody().getItems().get(i).getImgfilename());
        }

        return list;
    }

    // 산 인기 랭킹
    @GetMapping("/mountain/rank.do")
    @ResponseBody
    public List selectMountainByRank(){
        return mountainService.selectMountainByRank();
    }

    // 산 찜 기능
    @PostMapping("/mountain/followFN.do")
    @ResponseBody
    public int followMountainFunction(@RequestBody Map map){
        int result = mountainService.followMountainFunction(map);
        return result;
    }

}
