package project.group;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GroupDAO{

    @Autowired
    private SqlSession sqlSession;

    public void insertGroup(Map map){
        sqlSession.insert("group.insertGroup", map);
    }

    public void insertGroupMaster(Map map){sqlSession.insert("group.insertGroupMaster",map);}

    public List<Map> selectMainGroupList(){
        return sqlSession.selectList("group.selectMainGroupList");
    }

    public List<Map> selectAllGroupList(){
        return sqlSession.selectList("group.selectAllGroupList");
    }

    public void updateGroup(GroupVO vo){
        sqlSession.update("group.updateGroup", vo);
    }

    public void deleteGroup(int groupNum){
        sqlSession.delete("group.deleteGroup", groupNum);
    }

    public Map selectGroupDetail(int groupNum){
        return sqlSession.selectOne("group.selectGroupDetail", groupNum);
    }

    public List<Map> selectGroupDetailImage(int groupNum){
        return sqlSession.selectList("group.selectGroupDetailImage", groupNum);
    }

    public List<Map> selectGroupsByKeyword(String keyword){
        return sqlSession.selectList("group.selectGroupsByKeyword", keyword);
    }

    public int joinGroup(Map map){
        return sqlSession.insert("group.joinGroup",map);
    }
    public int withdrawGroup(Map map){return sqlSession.delete("group.withdrawGroup",map);}
    public int checkJoinedGroup(Map map){ return sqlSession.selectOne("group.checkJoinedGroup",map);}

    public List<Integer> listApplied(int groupNum){
        return sqlSession.selectList("group.listApplied",groupNum);
    }

    public int insertFavoriteGroup(Map map){
        return sqlSession.insert("group.insertFavorite",map);
    }

    public int checkFavoriteGroup(Map map){
        return sqlSession.selectOne("group.checkFavoriteGroup",map);
    }
    public int deleteFavoriteGroup(Map map){
        return sqlSession.delete("group.deleteFavoriteGroup",map);
    }
}
