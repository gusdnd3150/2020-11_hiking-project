package project.chat;

import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Map;


@Controller
@RequiredArgsConstructor
public class WebSocketController {

    @Resource(name = "chatService")
    private ChatService chatService;

    @MessageMapping("/chat/send/{roomId}")
    @SendTo("/topic/{roomId}")
    public Map sendMsg(@DestinationVariable String roomId, Map map){
        System.out.println("map 1 : " + map.toString());

        LocalDateTime localDateTime = LocalDateTime.parse((CharSequence) map.get("time"));
        Timestamp timestamp = Timestamp.valueOf(localDateTime);
        map.put("time",timestamp);

        System.out.println("map 2 : " + map.toString());

        chatService.insertMessage(map);
        return map;
    }
}