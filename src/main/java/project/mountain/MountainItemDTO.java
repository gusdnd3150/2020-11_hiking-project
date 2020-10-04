package project.mountain;

import lombok.Data;
import lombok.ToString;
import org.springframework.stereotype.Component;

import javax.xml.bind.annotation.XmlRootElement;

@ToString
@Component
@XmlRootElement(name = "item")
public class MountainItemDTO {

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

    public String getAeatreason() {
        return aeatreason;
    }

    public void setAeatreason(String aeatreason) {
        this.aeatreason = aeatreason;
    }

    public String getAreanm() {
        return areanm;
    }

    public void setAreanm(String areanm) {
        this.areanm = areanm;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getEtccourse() {
        return etccourse;
    }

    public void setEtccourse(String etccourse) {
        this.etccourse = etccourse;
    }

    public String getFlashurl() {
        return flashurl;
    }

    public void setFlashurl(String flashurl) {
        this.flashurl = flashurl;
    }

    public String getMntheight() {
        return mntheight;
    }

    public void setMntheight(String mntheight) {
        this.mntheight = mntheight;
    }

    public String getMntncd() {
        return mntncd;
    }

    public void setMntncd(String mntncd) {
        this.mntncd = mntncd;
    }

    public String getMntnm() {
        return mntnm;
    }

    public void setMntnm(String mntnm) {
        this.mntnm = mntnm;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getSubnm() {
        return subnm;
    }

    public void setSubnm(String subnm) {
        this.subnm = subnm;
    }

    public String getTourisminf() {
        return tourisminf;
    }

    public void setTourisminf(String tourisminf) {
        this.tourisminf = tourisminf;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public String getVideourl() {
        return videourl;
    }

    public void setVideourl(String videourl) {
        this.videourl = videourl;
    }
}
