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
        //방이 존재하는지 확인
        String existRoomId = checkExistRoom(groupNum);
        if(existRoomId!=""){
            System.out.println("existRoomId : " + existRoomId );
            return existRoomId; // 존재하면 존재하는 방번호 리턴
        }

        //존재하지 않으면 현재 멤버로 방 새로 만듦
        List<Map> UserIds = chatDAO.selectUserIdByGroupNum(groupNum);
        String roomId = getRandomString();

        System.out.println(roomId);

        for(Map m : UserIds){
            m.put("groupNum",groupNum);
            m.put("roomId",roomId);

            System.out.println("UserIds : "+m.toString());
        }
        int result = chatDAO.insertNewChatRoom(UserIds);
        System.out.println("result : "+ result); //1 : 방생성 완료

        return roomId;
    }
}