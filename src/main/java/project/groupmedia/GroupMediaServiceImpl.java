package project.groupmedia;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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
    public Map<String, Object> selectGroupMedia(int groupNum){
        Map<String, Object> map = null;
        try{
            map = groupMediaDAO.selectGroupMedia(groupNum);
        } catch (Exception e){
            e.printStackTrace();
        }
        return map;
    }

    @Override
    public Map<String,Object> selectGroupMediaOne(int groupNum){
        Map<String,Object> map = null;
        try{
            map = groupMediaDAO.selectGroupMediaOne(groupNum);
        } catch (Exception e){
            e.printStackTrace();
        }
        return map;
    }
}
