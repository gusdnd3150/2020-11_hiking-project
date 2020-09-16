package project.groupmulti.vo;

import lombok.Data;
import net.sf.cglib.core.Local;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Component
@Data
public class GroupMultiVO {

    private int groupNum;
    private int multiNum;
    private int type;
    private byte[] content;

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}
