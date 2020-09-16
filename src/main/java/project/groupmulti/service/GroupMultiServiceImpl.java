package project.groupmulti.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import project.groupmulti.dao.GroupMultiDAO;
import project.groupmulti.vo.GroupMultiVO;

import java.util.Map;

@Service
public class GroupMultiServiceImpl implements GroupMultiService{

    @Autowired
    GroupMultiDAO groupMultiDAO;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void uploadGroupMulti(GroupMultiVO groupMultiVO){
        try {
            groupMultiDAO.uploadContent(groupMultiVO);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }



}
