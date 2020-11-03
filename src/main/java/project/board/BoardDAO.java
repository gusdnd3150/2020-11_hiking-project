package project.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("boardDAO")
public class BoardDAO {

    @Autowired
    private SqlSession sqlSession;

    public List selectNotice(Map map){
        return sqlSession.selectList("board.selectNotice",map);
    }
}
