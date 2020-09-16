package project.groupmulti.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.groupmulti.vo.GroupMultiVO;

@Repository
public class GroupMultiDAOImpl implements GroupMultiDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void uploadContent(GroupMultiVO groupMultiVO) throws Exception {
        sqlSession.insert("mapper.groupMulti.insertGroupMulti", groupMultiVO);
    }
}
