package project.group;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import java.util.Map;

@Repository
public class GroupDAO{

    @Autowired
    private SqlSession sqlSession;

    public void insertGroup(Map map){
        sqlSession.insert("group.insertGroup", map);
    }
    public void insertGroupLeader(Map map){sqlSession.insert("group.insertGroupLeader",map);}
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
    //아직
    public List<Map> selectGroupsByKeyword(String keyword){
        return sqlSession.selectList("group.selectGroupsByKeyword", keyword);
    }

    public int joinGroup(Map map){
        return sqlSession.update("group.joinGroup",map);
    }
    public int withdrawGroup(Map map){
        return sqlSession.update("group.withdrawGroup",map);
    }
    public List selectWaitingList(Map map){
        return sqlSession.selectList("group.selectWaitingList",map);
    }
    //userAllowed void도 괜찮을까?
    public int userAllowed(Map map){
        int result = sqlSession.update("group.userAllowed",map);

        //여기에 모집인원 + 1 update 해줘야함 + 남은시간 자바스크립트 setInterval?
        return result;
    }
    public int userDisallowed(Map map){
        int result = sqlSession.update("group.userDisallowed",map);

        return result;
    }

    public int selectWaiting(Map map){ return sqlSession.selectOne("group.selectWaiting",map);}

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

    public int insertCommentGroup(Map map){
        return sqlSession.insert("group.insertCommentGroup",map);
    }
    public GroupCommentVO selectCommentOne(int commentNum){
        return sqlSession.selectOne("group.selectCommentOne",commentNum);
    }
    public List selectCommentByGroupNum(int groupNum){
        return sqlSession.selectList("group.selectCommentByGroupNum",groupNum);
    }
}
