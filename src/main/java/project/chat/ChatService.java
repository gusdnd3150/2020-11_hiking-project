package project.chat;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service("chatService")
public class ChatService {

    @Resource(name = "chatDAO")
    private ChatDao chatDAO;

    public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

    public String checkExistRoom(int groupNum){
        return chatDAO.checkExistRoom(groupNum);
    }

    @Transactional
    public String newChat(int groupNum){
        String existRoomId = checkExistRoom(groupNum);
        if(!existRoomId.equals("not_exist")){
            return existRoomId;
        }

        List<Map> UserIds = chatDAO.selectUserIdByGroupNum(groupNum);
        String roomId = getRandomString();

        for(Map m : UserIds){
            m.put("groupNum",groupNum);
            m.put("roomId",roomId);
        }
        chatDAO.insertNewChatRoom(UserIds);

        return roomId;
    }

    public List selectChatByRoomId(String roomId){
        return chatDAO.selectChatByRoomId(roomId);
    }
}