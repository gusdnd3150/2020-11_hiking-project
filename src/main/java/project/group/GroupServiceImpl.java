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

    public void insertGroup(GroupVO vo) {
        groupDAO.insertGroup(vo);
    }

    public List<GroupVO> selectGroupList(){
        return groupDAO.selectGroupList();
    }

    public void updateGroup(GroupVO vo){
        groupDAO.updateGroup(vo);
    }

    public void deleteGroup(int groupNum){
        groupDAO.deleteGroup(groupNum);
    }

    public Map selectGroupDetail(int groupNum){
        return groupDAO.selectGroupDetail(groupNum);
    }

    public List<Map> selectGroupsByKeyword(String keyword){
        return groupDAO.selectGroupsByKeyword(keyword);
    }
}
