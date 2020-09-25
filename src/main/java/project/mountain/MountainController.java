package project.mountain;

import io.swagger.models.auth.In;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.xml.sax.InputSource;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

@RestController
public class MountainController {

    @Autowired
    private MountainService mountainService;

//    @GetMapping("/apitest")
//    public JSONObject callapihttp(){
//        JSONObject result = XML.toJSONObject(callApi1("태백","강원",1,10));
//        return result;
//    }

    // 100대 명산 api 호출
    @GetMapping("/apitest1")
//    public String callApi1(String mtNm, String arNm, int pageNo, int numOfRows){
    public String callApi1(){
        StringBuffer result = new StringBuffer();
        try{
            String mtNm = "태백";
            String arNm = "강원";
            int pageNo = 1;
            int numOfRows = 10;

            String encodeMtNm = URLEncoder.encode(mtNm,"UTF-8");
            String encodeArNm = URLEncoder.encode(arNm,"UTF-8");


            String urlstr = "http://apis.data.go.kr/openapi/service/cultureInfoService/gdTrailInfoOpenAPI?" +
                    "serviceKey=cR%2BcfvKa26tKNcr3oafy%2Bm%2FqGChOangjMNksD2BN0cRAzZvubMN43fPhmhvknjMV9S4yegaPApQTCMSu0jwzYg%3D%3D" +
                    "&searchMtNm=" + encodeMtNm +
                    "&searchArNm=" + encodeArNm +
                    "&pageNo=" + pageNo +
                    "&numOfRows=" + numOfRows +
                    "&";

            URL url = new URL(urlstr);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

            String returnLine;
            result.append("<xmp>");
            while ((returnLine = br.readLine()) != null){
                result.append(returnLine + "\n");
            }
            urlConnection.disconnect();
        }catch(Exception e){
            e.printStackTrace();
        }

        return result+"</xmp>";
    }

    @GetMapping("/apitest2")
    //RequestBody 필요
    public Object mountainList() throws UnsupportedEncodingException {

        Object response = mountainService.getMountainInfo();

        return response;


    }

}
