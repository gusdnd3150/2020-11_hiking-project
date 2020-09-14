package project.group.vo;

import com.sun.istack.internal.NotNull;
import lombok.*;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class GroupVO {

    private String groupName;
    private int groupType;
    private int groupPeopleCount;
    private String groupDetail;
    private int groupStatus;
    private Date groupEnrollDate;
    private Date groupModDate;
    private String groupArea;
    private int groupAgeStart;
    private int groupAgeEnd;
    private int groupSex;
    private String mtNum;
    private Date groupStartDate;

}
