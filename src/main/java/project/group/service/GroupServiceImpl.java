package project.group.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import project.group.dao.GroupDAO;
import project.group.vo.GroupVO;

import java.util.List;
import java.util.Map;

@Service
public class GroupServiceImpl implements GroupService{

    @Autowired
    GroupDAO groupDAO;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int insertGroup(GroupVO groupVO) {
        try{
            groupDAO.insertGroup(groupVO);
        } catch (Exception e){
            e.printStackTrace();
        }
        return 1;
    }

    @Override
    public List<GroupVO> selectGroup(Map<String, Object> searchMap){
        List<GroupVO> list = null;
        try{
            list = groupDAO.selectGroup(searchMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    @Override
//    @Transactional(propagation = Propagation.REQUIRED)
//    public void updateGroup(Map<String, Object> updateMap){
//        try{
//            groupDAO.updateGroup(updateMap);
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//    }
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void updateGroup(GroupVO groupVO){
        try{
            groupDAO.updateGroup(groupVO);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void deleteGroup(Map<String, Object> deleteMap){
        try{
            groupDAO.deleteGroup(deleteMap);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<GroupVO> test(){
        List<GroupVO> list = groupDAO.test();
        return list;
    }
}
