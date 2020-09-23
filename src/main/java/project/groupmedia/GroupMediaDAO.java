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

    public void insertGroupMedia(GroupMediaVO groupMediaVO) throws Exception {
        sqlSession.insert("mapper.groupMedia.insertGroupMedia", groupMediaVO);
    }

    public Map<String, Object> selectGroupMedia(int groupNum) throws Exception {
        Map<String, Object> map = sqlSession.selectOne("mapper.groupMedia.selectGroupMedia",groupNum);
        return map;
    }

    public List<Map<String,Object>> selectGroupMediaOne(int groupNum) throws Exception {
        List<Map<String,Object>> list = sqlSession.selectList("mapper.groupMedia.selectGroupMediaOne", groupNum);
        return list;
    }
}
