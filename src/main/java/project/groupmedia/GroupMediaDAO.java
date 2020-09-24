package project.groupmedia;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GroupMediaDAO {

    @Autowired
    private SqlSession sqlSession;

    public void insertGroupMedia(GroupMediaVO groupMediaVO){
        sqlSession.insert("groupMedia.insertGroupMedia", groupMediaVO);
    }

    public byte[] selectGroupMediaOne(int groupNum){
        return sqlSession.selectOne("groupMedia.selectGroupMedia",groupNum);
    }

    public List<byte[]> selectGroupMediaDetail(int groupNum){
        return sqlSession.selectList("groupMedia.selectGroupMediaDetail", groupNum);

    }
}
