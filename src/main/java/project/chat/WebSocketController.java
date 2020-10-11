package project.chat;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;


@Controller
public class WebSocketController {

    @MessageMapping("/stomp")
    @SendTo("/topic/stomp")
    public ResponseEntity<String> stomp(String request) {
        return new ResponseEntity<String>(request, HttpStatus.OK);
    }
}