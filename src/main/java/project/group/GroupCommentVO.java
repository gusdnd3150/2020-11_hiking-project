package project.group;

import lombok.Data;
import org.springframework.stereotype.Component;

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
    private String userId;
    private LocalDateTime createdAt;
}