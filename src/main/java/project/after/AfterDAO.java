package project.after;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("afterDAO")
public class AfterDAO {

    @Autowired
    private SqlSession sqlSession;

    public void insertAfter(Map map){
        sqlSession.insert("after.insertAfter",map);
    }
}
