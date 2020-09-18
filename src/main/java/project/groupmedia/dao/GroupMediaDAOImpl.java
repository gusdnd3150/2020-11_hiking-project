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
    public List<GroupMediaVO> selectGroupMediaList() throws Exception {
        List<GroupMediaVO> list = sqlSession.selectList("mapper.groupMedia.selectGroupMediaList");
        return list;
    }

    @Override
    public byte[] selectGroupMediaOne(int groupNum) throws Exception {
        byte[] bytes = sqlSession.selectOne("mapper.groupMedia.selectGroupMediaOne", groupNum);
        return bytes;
    }
}
