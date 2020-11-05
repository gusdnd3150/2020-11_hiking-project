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
        if(sqlSession.selectOne("after.checkAfterExist",map)==null){
            return 0;
        }
        return 1;
    }
    public List selectAfterDetail(int afterNum){
        return sqlSession.selectList("after.selectAfterDetail",afterNum);
    }
    public List selectAllAfterList(){
        return sqlSession.selectList("after.selectAllAfterList");
    }
    public List selectMainAfterList(){
        return sqlSession.selectList("after.selectMainAfterList");
    }

    public int insertCommentAfter(Map map){
        return sqlSession.insert("after.insertCommentAfter",map);
    }
    public int updateSubCommentCount(Map map){
        return sqlSession.update("after.updateSubCommentCount",map);
    }
    public Map selectCommentOne(int commentNum){
        return sqlSession.selectOne("after.selectCommentOne",commentNum);
    }
    public List selectCommentByAfterNum(int afterNum){
        return sqlSession.selectList("after.selectCommentByAfterNum",afterNum);
    }
    public int selectLikeCount(int afterNum){
        Integer result = sqlSession.selectOne("after.selectLikeCount",afterNum);
        if(result==null){
            return 0;
        }
        return result;
    }
    public void insertAfterLike(Map map){
        sqlSession.insert("after.likeFunction",map);
    }
    public void updateAfterLike(Map map){
        sqlSession.delete("after.likeFunction",map);
    }
    public int checkAfterLike(Map map){
        Integer result = sqlSession.selectOne("after.checkAfterLike",map);
        if(result==null||result==0){
            return 0;
        }
        return 1;
    }
	public int countSubComment(Map map) {
		 return sqlSession.selectOne("after.countSubComment",map);
	}
	public void deleteComment(Map map){
        sqlSession.update("after.deleteComment",map);
    }
    public void deleteAfter(Map map){
        sqlSession.delete("after.deleteAfter",map);
    }
}
