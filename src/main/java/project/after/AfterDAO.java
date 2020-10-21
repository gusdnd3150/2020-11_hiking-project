package project.after;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("afterDAO")
public class AfterDAO {

    @Autowired
    private SqlSession sqlSession;

    public int insertAfter(Map map){
        return sqlSession.insert("after.insertAfter",map);
    }
    public int checkAfterExist(Map map){
        return sqlSession.selectOne("after.checkAfterExist",map);
    }
    public List selectAllAfterList(){
        return sqlSession.selectList("after.selectAllAfterList");
    }
}
