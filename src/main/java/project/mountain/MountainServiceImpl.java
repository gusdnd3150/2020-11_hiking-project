package project.mountain;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

@Service("mountainService")
public class MountainServiceImpl implements MountainService{

    @Value("${serviceKey}")
    private String serviceKey;

    @Value("${mountainURL}")
    private String mountainURL;

    private RestTemplate restTemplate = new RestTemplate();


    public MountainResponseVO getMountainInfo(String mtNm, String ArNm) throws UnsupportedEncodingException {

        UriComponents builder = UriComponentsBuilder.fromHttpUrl(mountainURL)
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
}
