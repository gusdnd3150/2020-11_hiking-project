package project.chat;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Data
public class ChatMessage {
    private int roomNum;
    private int chatNum;
    private String userId;
    private String message;
    LocalDateTime time;
}
