package project.group;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("groupService")
public class GroupServiceImpl implements GroupService{

    @Resource(name = "groupDAO")
    private GroupDAO groupDAO;

    @Transactional
    public void insertGroup(Map map) {
        groupDAO.insertGroup(map);
        groupDAO.insertGroupMaster(map);
    }

    public List<Map> selectMainGroupList(){
        return groupDAO.selectMainGroupList();
    }

    public List<Map> selectAllGroupList(){
        return groupDAO.selectAllGroupList();
    }

    //아직
    public void updateGroup(GroupVO vo){
        groupDAO.updateGroup(vo);
    }

    //아직
    public void deleteGroup(int groupNum){
        groupDAO.deleteGroup(groupNum);
    }

    public Map selectGroupDetail(int groupNum){
        return groupDAO.selectGroupDetail(groupNum);
    }

    public List<Map> selectGroupDetailImage(int groupNum){
        return  groupDAO.selectGroupDetailImage(groupNum);
    }

    public List<Map> selectGroupsByKeyword(String keyword){
        return groupDAO.selectGroupsByKeyword(keyword);
    }

    @Transactional
    public int joinGroup(Map map){
        return groupDAO.joinGroup(map);
    }

    @Transactional
    public int withdrawGroup(Map map){
        return groupDAO.withdrawGroup(map);
    }

    public int checkJoinedGroup(Map map){return groupDAO.checkJoinedGroup(map);}

    public List<Integer> listApplied(int groupNum){
        return groupDAO.listApplied(groupNum);
    }

    @Transactional
    public int insertFavoriteGroup(Map map){
        return groupDAO.insertFavoriteGroup(map);
    }

    public int checkFavoriteGroup(Map map){
        return groupDAO.checkFavoriteGroup(map);
    }

    @Transactional
    public int deleteFavoriteGroup(Map map){
        return groupDAO.deleteFavoriteGroup(map);
    }
}
