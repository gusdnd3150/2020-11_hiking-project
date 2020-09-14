package project.group.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import project.group.dao.GroupDAO;
import project.group.vo.GroupVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class GroupServiceImpl implements GroupService{

    @Autowired
    GroupDAO groupDAO;

    @Override
    public int insertGroup(GroupVO groupVO) throws Exception {
        groupDAO.insertGroup(groupVO);
        return 1;
    }

}
