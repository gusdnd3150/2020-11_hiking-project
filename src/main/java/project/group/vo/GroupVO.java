package project.group.vo;

import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

@Component
@Data
public class GroupVO {

    private int groupNum;
    private String name;
    private int type;                  // type: 1=instance, 0=not instance
    private int staffCurrent;           // staffCurrent : default 1
    private int staffMax;
    private String detail;
    private int status;                // status 0: end 1: normal
    private Date startDay;
    private String createdAt;    // default : sysdate
    private String updatedAt;
    private int area;               /* groupArea : '서울=1','부산=2','대구=3','인천=4','광주=5','대전=6',
                                                '울산=7','세종=8','경기=9',강원=10','충북=11','충남=12'
                                                '전북=13','전남=14','경북=15','경남=16','제주=17' */
    private int ageStart;              // groupAgeStart : default 0
    private int ageEnd;                // groupAgeEnd : default 100
    private int sex;                   // groupSex : 0 = nope, 1 = man, 2 = woman
    private String mtNum;

}
