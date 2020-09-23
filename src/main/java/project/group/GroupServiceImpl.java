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

    public List<GroupVO> selectGroup(Map<String, Object> map){
        return groupDAO.selectGroup(map);
    }

    public void updateGroup(GroupVO groupVO){
        groupDAO.updateGroup(groupVO);
    }

    public void deleteGroup(int groupNum){
        groupDAO.deleteGroup(groupNum);
    }

    public List<GroupVO> test(){
        List<GroupVO> list = groupDAO.test();
        return list;
    }
}
