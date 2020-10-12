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

    public List selectUserIdByGroupNum(int groupNum){
        List<Map> list = sqlSession.selectList("chat.selectUserIdByGroupNum", groupNum);
        return list;
    }

    public List selectChatByRoomId(String roomId){
        return sqlSession.selectList("chat.selectChatByRoomId",roomId);
    }
}
