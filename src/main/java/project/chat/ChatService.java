package project.chat;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("chatService")
public class ChatService {

    @Resource(name = "chatDAO")
    private ChatDao chatDAO;

    public int checkExistRoom(int groupNum){
        return chatDAO.checkExistRoom(groupNum);
    }

    public Long newRoom(int groupNum){
        Long existRoomNum = Long.valueOf(checkExistRoom(groupNum));
        if(existRoomNum!=0){
            return existRoomNum;
        }
        ChatRoom chatRoom = new ChatRoom();
        ChatRoom newChatRoom = chatDAO.chat
        Long chatRoomId = chatService.newRoom();

        return null;
    }
}