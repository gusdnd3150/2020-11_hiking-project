package project.group;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import project.groupmedia.GroupMediaService;
import project.mountain.MountainItemDTO;
import project.mountain.MountainResponseVO;
import project.mountain.MountainService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Slf4j
@Controller
public class GroupController{

    @Value("${mountainImagePath}")
    private String mountainImagePath;

    @Resource(name = "groupService")
    private GroupService groupService;

    @Resource(name = "groupMediaService")
    private GroupMediaService groupMediaService;

    @Resource(name = "mountainService")
    private MountainService mountainService;

    @PostMapping(value = "/group/insert.do")
    @ResponseBody
    public void insertGroup(@RequestParam Map map,
                           @RequestParam(value = "file", required = false) List<MultipartFile> files,
                           HttpServletRequest request) throws Exception {

        groupService.insertGroup(map);

        String path = request.getSession().getServletContext().getRealPath("/");
        int groupNum = (int) map.get("groupNum");
        groupMediaService.insertGroupMedia(groupNum,files,path);
    }

    @GetMapping("/group/main1.do")
    public ModelAndView goMain1(){
        ModelAndView mav = new ModelAndView("main1");
        List<Map> list = groupService.selectAllGroupList();
        mav.addObject("group",list);
        return mav;
    }

    @GetMapping("/group/main2.do")
    public ModelAndView goMain2() throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView("main2");
        MountainResponseVO mountainVO = mountainService.getMountainInfo("");

        List<MountainItemDTO> list = new ArrayList<>();

        for(MountainItemDTO mountainDTO : mountainVO.getBody().getItems()){

            MountainResponseVO imageVO = mountainService.getMountainImage(mountainDTO.getMntilistno());

            if (imageVO.getBody().getItems()==null){
                mountainDTO.setImgfilename("http://placehold.it/350x200");
            }else{
                mountainDTO.setImgfilename(mountainImagePath+imageVO.getBody().getItems().get(0).getImgfilename());
            }
            list.add(mountainDTO);
        }
        mav.addObject("mtInfo",list);
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

    @GetMapping("/group/{groupNum}")
    public ModelAndView groupDetail(@PathVariable("groupNum") int groupNum, HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/group/detail1");
        Map<String,Object> map = groupService.selectGroupDetail(groupNum);
        List<Map> list = groupService.selectGroupDetailImage(groupNum);

        String userId = (String) request.getSession().getAttribute("LOGIN");

        Map checkMap = new HashMap();
        checkMap.put("userId", userId);
        checkMap.put("groupNum",groupNum);
        int favoriteResult;
        try{
            favoriteResult = groupService.checkFavoriteGroup(checkMap);                                     //좋아요 체크
        }catch (Exception e){
            favoriteResult = 0;
        }
        int userGradeResult;
        try{
            userGradeResult = groupService.selectWaiting(checkMap);
            System.out.println("userGradeResult : "+userGradeResult);
        }catch (Exception e){
            userGradeResult = 2;                                                                        //비그룹 원
        }

        //같은 산의 다른모임 찾을 것

        //댓글

        for(int i=0;i<list.size();i++){
            map.put("image"+i , list.get(i).get("STOREDFILENAME"));

        }

        mav.addObject("group",map);
        mav.addObject("favoriteResult",favoriteResult);
        mav.addObject("userGradeResult",userGradeResult);
        return mav;
    }

    @GetMapping("/mountain/{mntiname}")
    public ModelAndView mountainDetail(@PathVariable("mntiname") String mntiname) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/group/detail2");
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

    @PostMapping("/group/join.do")
    @ResponseBody
    public int joinGroup(@RequestBody Map map){
        return groupService.joinGroup(map);
    }

    @PostMapping("/group/withdraw.do")
    @ResponseBody
    public int withdrawGroup(@RequestBody Map map){
        return groupService.withdrawGroup(map);
    }

    @PostMapping("/group/selectWaitingList.do")
    @ResponseBody
    public List selectWaitingList(@RequestBody Map map){
        return groupService.selectWaitingList(map);
    }

    // 유저 그룹 승인
    @GetMapping("/group/userAllowed.do")
    @ResponseBody
    public int userAllowed(@RequestParam("userId")String userId,
                           @RequestParam("groupNum")int groupNum){
        Map map = new HashMap();
        map.put("userId", userId);
        map.put("groupNum",groupNum);
        int result;
        result = groupService.userAllowed(map);

        System.out.println(result); //1

        return result;
    }

    // 유저 그룹 승인 취소
    @GetMapping("/group/userDisallowed.do")
    @ResponseBody
    public int userDisallowed(@RequestParam("userId")String userId,
                              @RequestParam("groupNum")int groupNum){
        Map map = new HashMap();
        map.put("userId", userId);
        map.put("groupNum", groupNum);
        int result = groupService.userDisallowed(map);

        return result;
    }

    // 그룹 좋아요 등록
    @PostMapping("/group/insertFavorite.do")
    @ResponseBody
    public int insertFavoriteGroup(@RequestBody Map map){
        int result = groupService.insertFavoriteGroup(map);

        return result;
    }

    // 그룹 좋아요 취소
    @PostMapping("/group/deleteFavorite.do")
    @ResponseBody
    public int deleteFavoriteGroup(@RequestBody Map map){
        int result = groupService.deleteFavoriteGroup(map);
        return result;
    }


    // 그룹 댓글
    @PostMapping("/group/insertComment")
    @ResponseBody
    public int insertCommentGroup(@RequestBody Map map){
        map.toString();
        return 0;
    }
}
