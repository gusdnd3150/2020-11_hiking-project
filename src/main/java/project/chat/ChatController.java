package project.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    @GetMapping("/chat/{groupNum}")
    public String newChat(@PathVariable("groupNum")int groupNum){

        //유저가 이방에 권한이 있는지 체크해야함
        String chatRoomId = chatService.newChat(groupNum);
        return "redirect:/chat/"+chatRoomId;
    }

    @GetMapping("/chat/{chatRoomId}")
    public String goChat(@PathVariable("chatRoomId")String chatRoomId){
        return "";
    }
}
