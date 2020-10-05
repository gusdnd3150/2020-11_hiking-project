package project.group;

import jdk.nashorn.internal.objects.annotations.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import project.groupmedia.GroupMediaService;
import project.mountain.MountainItemDTO;
import project.mountain.MountainItemsDTO;
import project.mountain.MountainResponseVO;
import project.mountain.MountainService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Slf4j
@Controller
public class GroupController{

    @Resource(name = "groupService")
    private GroupService groupService;

    @Resource(name = "groupMediaService")
    private GroupMediaService groupMediaService;

    @Resource(name = "mountainService")
    private MountainService mountainService;

    /*
     * 산모임 (인스턴스) 생성
     * @param Map 모임정보
     * @param file 이미지 파일
     */
    @PostMapping(value = "/group/insert.do")
    @ResponseBody
    public int insertGroup(@RequestParam Map map,
                           @RequestParam(value = "file", required = false) List<MultipartFile> files,
                           HttpServletRequest request) throws Exception {

        groupService.insertGroup(map);
        int result = (int) map.get("groupNum");
        String path = request.getSession().getServletContext().getRealPath("/");
        int mediaResult = groupMediaService.insertGroupMedia(result,files,path);

        return 0;
    }

    // 산오르기 메인1 (등산로 리스트)
    @GetMapping("/group/main1.do")
    public ModelAndView goMain1() throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView("main1");
        MountainResponseVO mountainVO = mountainService.getMountainInfo("");

        List<MountainItemDTO> list = new ArrayList<>();

        for(MountainItemDTO mountainDTO : mountainVO.getBody().getItems()){

            MountainResponseVO imageVO = mountainService.getMountainImage(mountainDTO.getMntilistno());

            if (imageVO.getBody().getItems()==null){
                mountainDTO.setImgfilename("http://placehold.it/350x200");
            }else{
                mountainDTO.setImgfilename("http://www.forest.go.kr/images/data/down/mountain/"+imageVO.getBody().getItems().get(0).getImgfilename());
            }
            list.add(mountainDTO);
        }
        mav.addObject("mtInfo",list);
        return mav;
    }

    @GetMapping("/group/main2.do")
    public ModelAndView goMain2(){
        ModelAndView mav = new ModelAndView("main2");
        List<Map> list = groupService.selectAllGroupList();
        mav.addObject("group",list);
        return mav;
    }

    @PostMapping("/group/update.do")
    public void updateGroup(@ModelAttribute GroupVO vo){
        groupService.updateGroup(vo);
    }

    @PostMapping("/group/delete.do")
    public void deleteGroup(@RequestParam("groupNum") int groupNum){
        groupService.deleteGroup(groupNum);
    }

    @GetMapping("/mountain/{mntiname}")
    public ModelAndView mountainDetail(@PathVariable("mntiname") String mntiname) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/group/detail1");
        MountainResponseVO mountainVO = mountainService.getMountainInfo(mntiname);

//        for(int i=0;i<mountainVO.getBody().getItems().size();i++) {
        MountainResponseVO imageVO = mountainService.getMountainImage(mountainVO.getBody().getItems().get(0).getMntilistno());
//            System.out.println(imageVO.toString());
//        }

        MountainItemDTO dto = mountainVO.getBody().getItems().get(0);//이거 고쳐야함 이름 겹치는산이 있다
        dto.setImgfilename("http://www.forest.go.kr/images/data/down/mountain/"+imageVO.getBody().getItems().get(0).getImgfilename());

        mav.addObject("mtInfo",dto);

        return mav;
    }

    @GetMapping("/group/{groupNum}")
    public ModelAndView groupDetail(@PathVariable("groupNum") int groupNum){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/group/detail2");
        Map<String,Object> map = groupService.selectGroupDetail(groupNum);
        List<Map> list = groupService.selectGroupDetailImage(groupNum);

        for(int i=0;i<list.size();i++){
            map.put("image"+i , list.get(i).get("STOREDFILENAME"));

        }
        mav.addObject("group", map);
        return mav;
    }

    @PostMapping("/group/join")
    public void joinGroup(@RequestParam("userNum") int userNum,
                          @RequestParam("groupNum") int groupNum){
        Map<String,Integer> map = new HashMap();
        map.put("userNum", userNum);
        map.put("groupNum",groupNum);

        groupService.joinGroup(map);

    }

    //
    @PostMapping("/group/listApplied")
    public List listApplied(@RequestParam("groupNum") int groupNum){
        List<Integer> list = groupService.listApplied(groupNum);
        list.forEach((v) -> {
            System.out.println("value :" + v);
        });
        return null;
    }
}
