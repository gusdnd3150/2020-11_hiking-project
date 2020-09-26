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

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

@RestController
public class MountainController {

    @Resource(name = "mountainService")
    private MountainService mountainService;

    @GetMapping("/apitest2")
    //RequestBody 필요
    public Object mountainList() throws UnsupportedEncodingException {

        Object response = mountainService.getMountainInfo();

        return response;


    }

}
