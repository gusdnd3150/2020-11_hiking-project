package project.chat;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class ChatRoomJoin {
    private int groupNum;
    private int roomNum;
    private String userId;
    private int joinNum;
}
