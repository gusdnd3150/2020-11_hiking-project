package project.group;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

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
        groupDAO.insertGroupLeader(map);
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
    public List selectWaitingList(Map map){
        return groupDAO.selectWaitingList(map);
    }

    public int selectWaiting(Map map){return groupDAO.selectWaiting(map);}

    @Transactional
    public int userAllowed(Map map){
        int result = 0;
        result = groupDAO.userAllowed(map);
        result = groupDAO.checkGroupExpired((Integer) map.get("groupNum"));
        return result;
    }

    @Transactional
    public int userDisallowed(Map map) {
        int result = 0;
        result = groupDAO.userDisallowed(map);
        result = groupDAO.checkGroupExpired((Integer) map.get("groupNum"));
        return result;
    }

    public int checkGroupExpired(int groupNum){
        return groupDAO.checkGroupExpired(groupNum);
    }

    public int expiredGroup(int groupNum){
        return groupDAO.expiredGroup(groupNum);
    }

    // check

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

    @Transactional
    public int insertCommentGroup(Map map){
        return groupDAO.insertCommentGroup(map);
    }

    @Transactional
    public int updateSubCommentCount(int parentNum){return groupDAO.updateSubCommentCount(parentNum);}

    public GroupCommentVO selectCommentOne(int commentNum){return groupDAO.selectCommentOne(commentNum);}

    public List selectCommentByGroupNum(int groupNum){
        return groupDAO.selectCommentByGroupNum(groupNum);
    }

    public String selectSessionIdImage(String userId){
        return groupDAO.selectSessionIdImage(userId);
    }
}
