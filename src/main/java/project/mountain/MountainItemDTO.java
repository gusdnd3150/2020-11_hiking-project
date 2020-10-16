package project.mountain;

import lombok.Data;

import lombok.ToString;
import org.springframework.stereotype.Component;

import javax.xml.bind.annotation.*;

@Data
@Component
@XmlRootElement(name = "item")
public class MountainItemDTO {

    // 명산등산로(산림공간정보 1:25000)
    private String aeatreason;
    private String areanm;
    private String details;
    private String etccourse;
    private String flashurl;
    private String mntheight;
    private String mntncd;
    private String mntnm;
    private String overview;
    private String subnm;
    private String tourisminf;
    private String transport;
    private String videourl;

    // 산정보 서비스(국내 소재 3,368개 설명)
    private String mntiadd;
    private String mntiadmin;
    private String mntiadminnum;
    private String mntidetails;
    private String mntihigh;
    private String mntilistno;
    private String mntiname;
    private String mntisname;
    private String mntisummary;
    private String mntitop;

    // 산정보 서비스(국내 소재 3,368개 설명) - 이미지
    private String imgfilename;
    private String imgname;
    private String imgno;

    public String getMntilistno() {
        return mntilistno;
    }

    public String getImgfilename() {
        return imgfilename;
    }

    public void setImgfilename(String imgfilename) {
        this.imgfilename = imgfilename;
    }

    public String getImgno() {
        return imgno;
    }

    public void setImgno(String imgno) {
        this.imgno = imgno;
    }
}
