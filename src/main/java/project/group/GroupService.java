package project.group;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface GroupService {

    void insertGroup(GroupVO groupVO) throws Exception;
    List<GroupVO> selectGroup(Map<String, Object> searchMap);
    void updateGroup(GroupVO groupVO);
    void deleteGroup(int groupNum);
    List<GroupVO> test();
}
