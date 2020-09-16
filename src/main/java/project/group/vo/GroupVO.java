package project.group.vo;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class GroupVO {

    private int groupNum;
    private String groupName;
    private int groupType;                  // groupType: 1: instance 2: San Moim
    private int groupPeopleCount;           // groupPeopleCount : default 1
    private String groupDetail;
    private int groupStatus;                // groupStatus (instance) 0: end 1: normal
    private Date groupEnrollDate;           // groupEnrollDate : default sysdate
    private Date groupModDate;
    private String groupArea;               /* groupArea : '서울','부산','대구','인천','광주','대전',
                                                '울산','세종','경기',강원','충북','충남'
                                                '전북','전남','경북','경남','제주' */
    private int groupAgeStart;              // groupAgeStart : default 0
    private int groupAgeEnd;                // groupAgeEnd : default 100
    private int groupSex;                   // groupSex : 0 = nope, 1 = man, 2 = woman
    private String mtNum;
    private Date groupStartDate;

}
