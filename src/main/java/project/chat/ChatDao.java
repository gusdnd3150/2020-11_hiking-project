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

    public int checkExistRoom(int groupNum){
        return sqlSession.selectOne("chat.checkExistRoom",groupNum);
    }
//    public Map createRoom(int groupNum){
//
//    }
}
