package project.search;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
public class SearchVO {
    private String type;
    private String period;
    private String sort;
    private String keyword;

    public SearchVO() {
    }

    public SearchVO(String type, String period, String sort, String keyword) {
        this.type = type;
        this.period = period;
        this.sort = sort;
        this.keyword = keyword;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "SearchVO{" +
                "type='" + type + '\'' +
                ", period='" + period + '\'' +
                ", sort='" + sort + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
