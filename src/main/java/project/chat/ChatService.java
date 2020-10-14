package project.chat;

import java.util.List;
import java.util.Map;

public interface ChatService {

    String checkExistRoom(int groupNum);
    String newChat(int groupNum);
    List<Map> selectChatByRoomId(String roomId);
    void insertMessage(Map map);
    List checkValidUser(String roomId);
}
