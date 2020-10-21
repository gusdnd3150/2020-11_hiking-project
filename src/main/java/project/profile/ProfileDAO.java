package project.profile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("profileDAO")
public class ProfileDAO {

    @Autowired
    private SqlSession sqlSession;

    public Map selectUserProfileById(String userId){
        return sqlSession.selectOne("profile.selectUserProfileById",userId);
    }
}
