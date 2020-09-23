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
    private int type;
    private byte[] content;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }
}
