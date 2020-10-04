package project.mountain;

import lombok.ToString;
import org.springframework.stereotype.Component;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.Map;

@ToString
@Component
@XmlRootElement(name = "response")
public class MountainResponseVO {
    private Map<String, String> header;
    private MountainItemsDTO body;

    public Map<String, String> getHeader() {
        return header;
    }

    public void setHeader(Map<String, String> header) {
        this.header = header;
    }

    public MountainItemsDTO getBody() {
        return body;
    }

    public void setBody(MountainItemsDTO body) {
        this.body = body;
    }

}
