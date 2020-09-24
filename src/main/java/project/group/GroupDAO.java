package project.group;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GroupDAO{

    @Autowired
    private SqlSession sqlSession;

    public void insertGroup(GroupVO vo){
        sqlSession.insert("group.insertGroup", vo);
    }

    public List<GroupVO> selectGroupList(){
        return sqlSession.selectList("group.selectGroupList");
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

    public List<Map> selectGroupsByKeyword(String keyword){
        return sqlSession.selectList("group.selectGroupsByKeyword", keyword);
    }
}
