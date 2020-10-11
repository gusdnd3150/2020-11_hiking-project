package project.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ChatController {

    @Resource(name = "chatService")
    private ChatService chatService;

    @GetMapping("/chat.do")
    public String chat(){
        return "chat/chat";
    }

    @PostMapping("/chat/new.do")
    public String newChat(@RequestParam("groupNum")int groupNum){
        Long chatRoomNum = Long.valueOf(chatService.newRoom(groupNum));
        return "redirect/chat/"+chatRoomNum;
    }
}
