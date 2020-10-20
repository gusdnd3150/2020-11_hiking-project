package project.group;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.stereotype.Component;

import java.lang.reflect.Array;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Document(indexName = "index01", type="groups")
public class GroupVO {

    @Id
    private int groupNum;               // 그룹 번호
    private String name;                // 그룹 이름
    private int type;                   // 그룹 타입 : 1=인스턴스, 2=산모임
    private int staffCurrent;           // 그룹 현재 인원
    private int staffMax;               // 그룹 최대 인원
    private String detail;              // 그룹 상세
    private int status;                 // 그룹 상태 : 0=종료, 1=진행중
    private String startDay;            // 그룹 등산 시작일
    private String createdAt;           // 생성 일자
    private String updatedAt;           // 수정 일자
    private String area;                // 그룹 지역
    private int ageStart;               // 그룹 시작 나이
    private int ageEnd;                 // 그룹 끝 나이
    private String sex;                 // 그룹 성별
    private String mtNm;               // 등산로명

}
