package project.chat;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;


@Controller
@RequiredArgsConstructor
public class WebSocketController {

//    @MessageMapping("/stomp")
//    @SendTo("/topic/stomp")
//    public ResponseEntity<String> stomp(String request) {
//        return new ResponseEntity<String>(request, HttpStatus.OK);
//    }

    @MessageMapping("/chat/send/{roomId}")
    @SendTo("/topic/{roomId}")
    public void sendMsg(@DestinationVariable String roomId, ChatMessage message){

    }


}