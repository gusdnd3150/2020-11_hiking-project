package project.group.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.group.vo.GroupVO;

@Repository
public class GroupDAOImpl implements GroupDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertGroup(GroupVO groupVO) throws Exception {
        sqlSession.insert("mapper.group.insertGroup", groupVO);
    }
}
