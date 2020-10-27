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

        System.out.println(map.toString());

        return map;
    }
}