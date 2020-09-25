package project.mountain;

import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.http.converter.xml.MappingJackson2XmlHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.List;

@Service
public class MountainService {

    private RestTemplate restTemplate = new RestTemplate();
    private final String serviceKey = "cR%2BcfvKa26tKNcr3oafy%2Bm%2FqGChOangjMNksD2BN0cRAzZvubMN43fPhmhvknjMV9S4yegaPApQTCMSu0jwzYg%3D%3D";
    private String mountainURL = "http://apis.data.go.kr/openapi/service/cultureInfoService/gdTrailInfoOpenAPI";

    public Object getMountainInfo() throws UnsupportedEncodingException {

        UriComponents builder = UriComponentsBuilder.fromHttpUrl(mountainURL)
                .queryParam("serviceKey",URLDecoder.decode(serviceKey, "UTF-8"))
                .queryParam("searchMtNm","")//%EA%B0%80
                .queryParam("searchArNm","")
                .queryParam("pageNo",1)
                .queryParam("numOfRows",10)
                .build();

        System.out.println(builder.toUriString()); //Ok


        List<Object> list = restTemplate.getForObject(builder.toUriString(), List.class);

        System.out.println(list.toString());

        return null;
    }
}
