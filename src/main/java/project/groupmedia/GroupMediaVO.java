package project.groupmedia;

import lombok.Data;
import org.springframework.stereotype.Component;
import java.time.LocalDateTime;
import java.util.Arrays;

@Component
@Data
public class GroupMediaVO {

    private int groupNum;
    private int mediaNum;
    private String fileSize;
    private String storedFileName;
    private String originalFileName;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}
