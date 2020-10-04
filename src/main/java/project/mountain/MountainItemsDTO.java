package project.mountain;

import lombok.Data;
import lombok.ToString;
import org.springframework.stereotype.Component;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

@ToString
@Component
@XmlRootElement(name = "body")
public class MountainItemsDTO {
    private List<MountainItemDTO> items;
    private String numOfRows;
    private String pageNo;
    private String totalCount;

    @XmlElementWrapper(name = "items")
    @XmlElement(name = "item")
    public List<MountainItemDTO> getItems() {
        return items;
    }

    public void setItems(List<MountainItemDTO> items) {
        this.items = items;
    }

    @XmlElement(name = "numOfRows")
    public String getNumOfRows() {
        return numOfRows;
    }

    public void setNumOfRows(String numOfRows) {
        this.numOfRows = numOfRows;
    }

    @XmlElement(name = "pageNo")
    public String getPageNo() {
        return pageNo;
    }

    public void setPageNo(String pageNo) {
        this.pageNo = pageNo;
    }

    @XmlElement(name = "totalCount")
    public String getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(String totalCount) {
        this.totalCount = totalCount;
    }
}
