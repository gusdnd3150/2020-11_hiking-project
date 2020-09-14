package project.group.dao;

import org.springframework.stereotype.Repository;
import project.group.vo.GroupVO;

public interface GroupDAO {
    void insertGroup(GroupVO groupVO) throws Exception;
}
