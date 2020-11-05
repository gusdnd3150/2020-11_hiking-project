package project.group;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Component
@Data
public class GroupCommentVO {

    private int commentNum;
    private int parentNum;
    private int depts;
    private int commentOrder;
    private int groupNum;
    private String content;
    private String id;
    private int subCommentCount;
    private Timestamp createdAt;
    private int deleted;

    private int postNum;
    private String content2;
    private String nickname;
}
