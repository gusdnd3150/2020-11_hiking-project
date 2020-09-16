package project.group.dao;

import project.group.vo.GroupVO;

import java.util.List;
import java.util.Map;

public interface GroupDAO {
    void insertGroup(GroupVO groupVO);
    List<GroupVO> selectGroup(Map<String, Object> searchMap);

    void updateGroup(GroupVO groupVO);

    void deleteGroup(Map<String, Object> deleteMap);
}
