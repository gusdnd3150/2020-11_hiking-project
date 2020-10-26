package project.mountain;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("mountainDAO")
public class MountainDAO {

    @Autowired
    private SqlSession sqlSession;

    public List selectMountainByRank(){
        return sqlSession.selectList("mountain.selectMountainByRank");
    }

    public int followMountainFunction(Map map){
        return sqlSession.insert("mountain.followMountainFunction",map);
    }

    public String checkMtLike(Map map){
        return sqlSession.selectOne("mountain.checkMtLike",map);
    }
    public int followMountainCount(String mntilistno){
        return sqlSession.selectOne("mountain.followMountainCount",mntilistno);
    }
}
