package project.chat;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("chatDAO")
public class ChatDao {

    @Autowired
    private SqlSession sqlSession;

    public String checkExistRoom(int groupNum){
        return sqlSession.selectOne("chat.checkExistRoom",groupNum);
    }

    public int insertNewChatRoom(List<Map> chatUsers){
        int result = 0;
        for(Map m : chatUsers){
            result = sqlSession.insert("chat.insertNewChatRoom", m);
        }
        return result;
    }

    public List<Map> selectUserIdByGroupNum(int groupNum){
        return sqlSession.selectList("chat.selectUserIdByGroupNum", groupNum);
    }

    public List<Map> selectChatByRoomId(String roomId){
        return sqlSession.selectList("chat.selectChatByRoomId",roomId);
    }

    public void insertMessage(Map map){
        sqlSession.insert("chat.insertMessage",map);
    }

    public List checkValidUser(Map map){
        return sqlSession.selectList("chat.checkValidUser",map);
    }

    public void insertUserToChatRoom(Map map){
        sqlSession.insert("chat.insertUserToChatRoom",map);
    }
    public void deleteUserFromChatRoom(Map map){
        sqlSession.delete("chat.deleteUserFromChatRoom",map);
    }

    public int countPushAlarm(String userId){
        return sqlSession.selectOne("chat.countPushAlarm",userId);
    }
}
