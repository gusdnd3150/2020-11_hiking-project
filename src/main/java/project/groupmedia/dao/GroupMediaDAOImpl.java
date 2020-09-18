package project.groupmedia.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.group.vo.GroupVO;
import project.groupmedia.vo.GroupMediaVO;

import java.util.List;
import java.util.Map;

@Repository
public class GroupMediaDAOImpl implements GroupMediaDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertGroupMedia(GroupMediaVO groupMediaVO) throws Exception {
        sqlSession.insert("mapper.groupMedia.insertGroupMedia", groupMediaVO);
    }

    @Override
    public Map<String, Object> selectGroupMedia(int groupNum) throws Exception {
        Map<String, Object> map = sqlSession.selectOne("mapper.groupMedia.selectGroupMedia",groupNum);
        return map;
    }

    @Override
    public Map<String,Object> selectGroupMediaOne(int groupNum) throws Exception {
        Map<String, Object> map = sqlSession.selectOne("mapper.groupMedia.selectGroupMediaOne", groupNum);
        return map;
    }
}
