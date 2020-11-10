package project.chat;

import java.util.List;
import java.util.Map;

public interface ChatService {

    String checkExistRoom(int groupNum);
    String newChat(int groupNum);
    List<Map> selectChatByRoomId(String roomId);
    void insertMessage(Map map);
    List checkValidUser(Map map);

    void insertUserToChatRoom(Map map);
    void deleteUserFromChatRoom(Map map);

    int countPushAlarm(String userId);
    List selectResponseAlarm(String userId);
    List selectRequestAlarm(String userId);

    void updateAlarm(String userId);
}
