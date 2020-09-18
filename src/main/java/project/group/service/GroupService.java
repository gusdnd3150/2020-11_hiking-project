package project.group.service;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import project.group.vo.GroupVO;

import java.util.List;
import java.util.Map;

public interface GroupService {

    int insertGroup(GroupVO groupVO) throws Exception;
    List<GroupVO> selectGroup(Map<String, Object> searchMap);

    @Transactional(propagation = Propagation.REQUIRED)
    void updateGroup(GroupVO groupVO);

    @Transactional(propagation = Propagation.REQUIRED)
    void deleteGroup(Map<String, Object> deleteMap);

    List<GroupVO> test();
}
