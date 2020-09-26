package project.mountain;

import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Value;
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

@Service("mountainService")
public class MountainServiceImpl implements MountainService{

    @Value("${serviceKey}")
    private String serviceKey;

    @Value("${mountainURL}")
    private String mountainURL;

    private RestTemplate restTemplate = new RestTemplate();


    public List getMountainInfo() throws UnsupportedEncodingException {

        UriComponents builder = UriComponentsBuilder.fromHttpUrl(mountainURL)
                .queryParam("serviceKey",URLDecoder.decode(serviceKey, "UTF-8"))
                .queryParam("searchMtNm","")//%EA%B0%80
                .queryParam("searchArNm","")
                .queryParam("pageNo",1)
                .queryParam("numOfRows",10)
                .build();

//        System.out.println(builder.toUriString());

        List<Object> list = restTemplate.getForObject(builder.toUriString(), List.class);

        return list;
    }
}
