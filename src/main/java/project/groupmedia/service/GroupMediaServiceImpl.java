package project.groupmedia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import project.groupmedia.dao.GroupMediaDAO;
import project.groupmedia.vo.GroupMediaVO;

import java.util.List;

@Service
public class GroupMediaServiceImpl implements GroupMediaService {

    @Autowired
    GroupMediaDAO groupMediaDAO;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void insertGroupMedia(GroupMediaVO groupMediaVO){
        try {
            groupMediaDAO.insertGroupMedia(groupMediaVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<GroupMediaVO> selectGroupMediaList(){
        List<GroupMediaVO> list = null;
        try{
            list = groupMediaDAO.selectGroupMediaList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public byte[] selectGroupMediaOne(int groupNum){
        byte[] bytes = null;
        try{
            bytes = groupMediaDAO.selectGroupMediaOne(groupNum);
        } catch (Exception e){
            e.printStackTrace();
        }
        return bytes;
    }
}
