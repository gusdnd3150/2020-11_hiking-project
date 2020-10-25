package project.mountain;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

@Service("mountainService")
public class MountainServiceImpl implements MountainService{

    @Value("${serviceKey}")
    private String serviceKey;

    @Value("${mountainURL100}")
    private String mountainURL100;

    @Value("${mountainURL}")
    private String mountainURL;

    @Value("${mountainImageURL}")
    private String mountainImageURL;

    private RestTemplate restTemplate = new RestTemplate();

    @Resource(name = "mountainDAO")
    private MountainDAO mountainDAO;


    public MountainResponseVO get100MountainInfo(String mtNm, String ArNm) throws UnsupportedEncodingException {

        UriComponents builder = UriComponentsBuilder.fromHttpUrl(mountainURL100)
                .queryParam("serviceKey",URLDecoder.decode(serviceKey, "UTF-8"))
                .queryParam("searchMtNm",mtNm)
                .queryParam("searchArNm",ArNm)
                .queryParam("pageNo",1)
                .queryParam("numOfRows",10)
                .build();

//        System.out.println(builder.toUriString());

        MountainResponseVO vo = restTemplate.getForObject(builder.toUriString(), MountainResponseVO.class);

        return vo;
    }

    public MountainResponseVO getMountainInfo(String searchWrd) throws UnsupportedEncodingException {

        UriComponents builder = UriComponentsBuilder.fromHttpUrl(mountainURL)
                .queryParam("serviceKey",URLDecoder.decode(serviceKey, "UTF-8"))
                .queryParam("searchWrd",searchWrd)
                .build();

//        System.out.println(builder.toUriString());

        MountainResponseVO vo = restTemplate.getForObject(builder.toUriString(), MountainResponseVO.class);

        return vo;
    }

    public MountainResponseVO getMountainImage(String mntiListNo) throws UnsupportedEncodingException {

        UriComponents builder = UriComponentsBuilder.fromHttpUrl(mountainImageURL)
                .queryParam("serviceKey",URLDecoder.decode(serviceKey, "UTF-8"))
                .queryParam("mntiListNo",mntiListNo)
                .build();

//        System.out.println(builder.toUriString());

        MountainResponseVO vo = restTemplate.getForObject(builder.toUriString(), MountainResponseVO.class);

        return vo;
    }

    public List selectMountainByRank(int rowNum){
        return mountainDAO.selectMountainByRank(rowNum);
    }
    public int followMountainFunction(Map map){
        return mountainDAO.followMountainFunction(map);
    }

    public String checkMtLike(Map map){
        return mountainDAO.checkMtLike(map);
    }
    public int followMountainCount(String mntilistno){
        return mountainDAO.followMountainCount(mntilistno);
    }
}
