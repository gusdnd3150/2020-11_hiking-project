package project.chat;

import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Map;


@Controller
@RequiredArgsConstructor
public class WebSocketController {

    @Resource(name = "chatService")
    private ChatService chatService;

    @MessageMapping("/chat/send/{roomId}")
    @SendTo("/topic/{roomId}")
    public Map sendMsg(@DestinationVariable String roomId, Map map){
        LocalDateTime inputTime = LocalDateTime.parse((CharSequence) map.get("messagedAt"));
        Timestamp insertTs = Timestamp.valueOf(inputTime);
        map.put("messagedAt",insertTs);
        chatService.insertMessage(map);

        LocalDateTime now = LocalDateTime.now();
        Timestamp ts = Timestamp.valueOf(now);
        long minute = (ts.getTime() - insertTs.getTime())/60000; // 이거 써먹자 ( keep )

        return map;
    }
}