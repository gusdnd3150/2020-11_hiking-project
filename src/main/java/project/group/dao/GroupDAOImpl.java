package project.group.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.group.vo.GroupVO;

import java.util.List;
import java.util.Map;

@Repository
public class GroupDAOImpl implements GroupDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertGroup(GroupVO groupVO) {
        try{
            sqlSession.insert("mapper.group.insertGroup", groupVO);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<GroupVO> selectGroup(Map<String, Object> searchMap) {
        List<GroupVO> list = null;

        try{
            list = sqlSession.selectList("mapper.group.selectGroup", searchMap);
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

//    @Override
//    public void updateGroup(Map<String, Object> updateMap){
//        try{
//            sqlSession.update("mapper.group.updateGroup", updateMap);
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//    }
    @Override
    public void updateGroup(GroupVO groupVO){
        try{
            sqlSession.update("mapper.group.updateGroup", groupVO);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteGroup(Map<String, Object> deleteMap){
        try {
            sqlSession.delete("mapper.group.deleteGroup", deleteMap);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<GroupVO> test(){
        List<GroupVO> list = null;
        try{
            list = sqlSession.selectList("mapper.group.selectGroupList");
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
