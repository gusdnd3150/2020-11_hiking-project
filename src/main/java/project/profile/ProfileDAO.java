package project.profile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("profileDAO")
public class ProfileDAO {

    @Autowired
    private SqlSession sqlSession;

    public Map selectUserProfileById(String userId){
        return sqlSession.selectOne("profile.selectUserProfileById",userId);
    }

	public int countFollowBoth(Map<String, Object> m) {
		return sqlSession.selectOne("profile.countFollowBoth", m);
	}

	public int countFollowStatus(Map<String, Object> m) {
		   return sqlSession.selectOne("profile.countFollowStatus", m);
	
	}
	
	public int insertUserFollow(Map<String, Object> map) {
		sqlSession.insert("profile.insertUserFollow", map);
		return 1;
	}


	public int deleteUserFollow(Map<String, Object> map) {
		sqlSession.delete("profile.deleteUserFollow", map);
		return 1;
	}

	public List<Map> selectFollowingList(String userId) {
		return sqlSession.selectList("profile.selectFollowingList",userId);
	}

	public List<Map> selectFollowerList(String userId) {
		return sqlSession.selectList("profile.selectFollowerList",userId);
	}
	
	public Map<String, Object> selectFollowCnt(String userId) {
		return sqlSession.selectOne("profile.selectFollowCnt",userId);
	}
	
}
