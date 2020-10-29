package project.mountain;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import project.group.GroupService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.*;

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

    @GetMapping("/trail/{searchWrd}.do")
    public ModelAndView getTrailInfo(@PathVariable("searchWrd")String searchWrd) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView("/mountain/detail2");

        MountainResponseVO vo = mountainService.getTrailInfo(searchWrd);

        List<MountainItemDTO> list = new ArrayList<>();
        for(int i=0;i<vo.getBody().getItems().size();i++){
            list.add(vo.getBody().getItems().get(i));
        }

        mav.addObject("trail",list);
        return mav;
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

    @PostMapping("/searchMt.do")
    public MountainResponseVO searchMt(@RequestBody Map map) throws UnsupportedEncodingException {

        String mtNm = (String) map.get("mtNm");
        String arNm = (String) map.get("arNm");

        MountainResponseVO vo = mountainService.get100MountainInfo(mtNm, arNm);

        return vo;

    }

    @PostMapping("/searchTrail.do")
    public MountainResponseVO searchTrail(@RequestBody Map map) throws UnsupportedEncodingException {

        String searchWrd = (String) map.get("searchWrd");

        MountainResponseVO vo = mountainService.getTrailInfo(searchWrd);

        return vo;
    }
    public static String getRandomString() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    @Transactional
    @PostMapping("/mountain/trail/upload.do")
    public String trailInfoUpload(@RequestParam("file") List<MultipartFile> files, HttpServletRequest request){

        JSONParser jsonParser = new JSONParser();

        String requestPath = request.getSession().getServletContext().getRealPath("/");

        String jsonPath = "/resources/json/";
        String savePath = requestPath + jsonPath;

        File file = new File(savePath);
        if (file.exists() == false) {
            file.mkdirs();
        }

        Map trailInfo = new HashMap();


        try {
            for(MultipartFile m : files){
                file = new File(savePath + m.getOriginalFilename());
                m.transferTo(file);
                Object obj = jsonParser.parse(new FileReader(file));
                JSONObject jsonObject = (JSONObject) obj;

                List features = (List) jsonObject.get("features");
                Map attributes = (Map) features.get(0); //등산로 정보
                Map innerAttributes = (Map) attributes.get("attributes");

//                System.out.println("attributes : "+attributes.toString());
//                System.out.println("innerAttributes : " + innerAttributes.toString());

                trailInfo = innerAttributes;

                Map geometry = (Map) attributes.get("geometry");
                List paths = new ArrayList();

                Map path = new HashMap();
                if(paths != null){
                    paths = (List) geometry.get("paths");

                    for(int i=0;i<paths.size();i++){
                        List pathPoint = (List) paths.get(i);
                        for(int j=0;j<pathPoint.size();j++){
//                        System.out.println("pathPoint " +i+" : " + pathPoint.get(j).toString());
                            List point = (List) pathPoint.get(j);

                            path.put("MNTN_CODE", trailInfo.get("MNTN_CODE"));
                            path.put("FID", trailInfo.get("FID"));
                            path.put("MNTN_CODE", trailInfo.get("MNTN_CODE"));
                            path.put("LOCATIONX", point.get(0));
                            path.put("LOCATIONY", point.get(1));
                            mountainService.insertTrailLocation(path);
                        }
                    }
                }
            }

            System.out.println("trailInfo : "+ trailInfo);
            mountainService.insertTrailInfo(trailInfo); //trail 정보 입력

        } catch (Exception e){
            e.printStackTrace();
        }

        return "";
    }

    public File convert(MultipartFile mfile) throws IOException {
        File file = new File(mfile.getOriginalFilename());
        file.createNewFile();
        FileOutputStream fos = new FileOutputStream(file);
        fos.write(mfile.getBytes());
        fos.close();
        return file;
    }


    @GetMapping("/mountain/trail/{MNTN_CODE}")
    @ResponseBody
    public List selectTrailLocation(@PathVariable("MNTN_CODE")int mntn_code,
                                    @RequestParam("FID")int fid){

        System.out.println(mntn_code);
        System.out.println(fid);
        Map map = new HashMap();

        map.put("MNTN_CODE",mntn_code);
        map.put("FID",fid);

        List list = mountainService.selectTrailLocation(map);
        System.out.println(list.toString());

        return list;
    }

}
