package project.group;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import java.util.Map;

@Repository("groupDAO")
public class GroupDAO{

    @Autowired
    private SqlSession sqlSession;

    public void insertGroup(Map map){
       System.out.println("insertGroup: "+ map);
    	sqlSession.insert("group.insertGroup", map);
    }
    public void insertGroupLeader(Map map){
    	sqlSession.insert("group.insertGroupLeader",map);
    }
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
        return sqlSession.update("group.joinGroup",map);
    }
    public int withdrawGroup(Map map){

        String action = (String) map.get("action");
        int result = 0 ;

        result = sqlSession.update("group.withdrawGroup",map);

        if(action!=null){
            result = sqlSession.update("group.updateGroupCount",map);
        }

        return result;
    }
    public List selectWaitingList(Map map){
        return sqlSession.selectList("group.selectWaitingList",map);
    }

    //userAllowed void로 수정
    public int userAllowed(Map map){
        int result = 0;
        result = sqlSession.update("group.userAllowed",map);
        result = sqlSession.update("group.updateGroupCount",map);

        return result;
    }
    
    public int userDisallowed(Map map){
        int result = 0;
        result = sqlSession.update("group.userDisallowed",map);
        result = sqlSession.update("group.updateGroupCount",map);

        return result;
    }

    // 1 : 가능, 0 : 만료
    public int checkGroupExpired(int groupNum){
        int result = 1;
        if(sqlSession.selectOne("group.checkGroupExpired",groupNum)!=null){
            result = 0;
        }
        return result;
    }
    public int expiredGroup(int groupNum){
        return sqlSession.update("group.expiredGroup",groupNum);
    }

    public Map selectWaiting(Map map){
        return sqlSession.selectOne("group.selectWaiting",map);}

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
    System.out.println("mmmmmm   " + map );
        return sqlSession.insert("group.insertCommentGroup",map);
    }
    
    public int updateSubCommentCount(int parentNum){
        return sqlSession.update("group.updateSubCommentCount",parentNum);
    }
    
    public GroupCommentVO selectCommentOne(int commentNum){
        return sqlSession.selectOne("group.selectCommentOne",commentNum);
    }
    
    public List selectCommentByGroupNum(int groupNum){
        return sqlSession.selectList("group.selectCommentByGroupNum",groupNum);
    }
    
    public List selectCommentByPostNum(int postNum){
       return sqlSession.selectList("group.selectCommentByPostNum",postNum);
   }
    
    public String selectSessionIdImage(String userId){
        return sqlSession.selectOne("group.selectSessionIdImage", userId);
    }
    public List sortGroupByKeyword(Map map){
        return sqlSession.selectList("group.sortGroupByKeyword",map);
    }
    public List recommendGroup(Map map){
        return sqlSession.selectList("group.recommendGroup",map);
    }

	public int countSubComment(Map map) {
		 return sqlSession.selectOne("group.countSubComment",map);
	}
	public int updateGroupInfo(Map map){
        return sqlSession.update("group.updateGroup",map);
    }
    public void deleteGroup(Map map){
        sqlSession.delete("group.deleteGroup",map);
    }
    public void deleteComment(Map map){
        sqlSession.update("group.deleteComment",map);
    }

    public List selectGroupLikeById(String userId){
        return sqlSession.selectList("group.selectGroupLikeById",userId);
    }
}
