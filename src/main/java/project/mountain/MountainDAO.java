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
    public List selectTrailByRank(){
        return sqlSession.selectList("mountain.selectTrailByRank");
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
    public void insertTrailInfo(Map map){
        sqlSession.insert("mountain.insertTrailInfo",map);
    }
    public void insertTrailLocation(Map map){
        sqlSession.insert("mountain.insertTrailLocation",map);
    }
    public void insertTrailSpot(Map map){
        sqlSession.insert("mountain.insertTrailSpot",map);
    }

    public List selectTrailLocation(Map map){
        return sqlSession.selectList("mountain.selectTrailLocation",map);
    }
    public List selectTrailInfo(Map map){
        return sqlSession.selectList("mountain.selectTrailInfo",map);
    }
    public List selectTrailSumInfo(Map map){
        return sqlSession.selectList("mountain.selectTrailSumInfo",map);
    }
    public List selectTrailSpot(Map map){
        return sqlSession.selectList("mountain.selectTrailSpot",map);
    }
    public List selectTrailDetailInfo(Map map){
        return sqlSession.selectList("mountain.selectTrailDetailInfo",map);
    }
    public String checkTrailLike(Map map){
        return sqlSession.selectOne("mountain.checkTrailLike",map);
    }
    public int trailLikeFunction(Map map){
        return sqlSession.insert("mountain.trailLikeFunction",map);
    }

    public List selectAllTrailList(Map map){
        return sqlSession.selectList("mountain.selectAllTrailList",map);
    }
    public int countAllTrail(){
        return sqlSession.selectOne("mountain.countAllTrail");
    }
    public List selectTrailLikeById(String userId){
        return sqlSession.selectList("mountain.selectTrailLikeById",userId);
    }
    public List selectTrailByKeyword(Map map){
        return sqlSession.selectList("mountain.selectTrailByKeyword",map);
    }
}
