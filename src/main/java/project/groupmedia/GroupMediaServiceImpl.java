package project.groupmedia;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("groupMediaService")
public class GroupMediaServiceImpl implements GroupMediaService {

    @Resource(name = "groupMediaDAO")
    GroupMediaDAO groupMediaDAO;

    @Transactional(propagation = Propagation.REQUIRED)
    public void insertGroupMedia(GroupMediaVO groupMediaVO){
        try {
            groupMediaDAO.insertGroupMedia(groupMediaVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public byte[] selectGroupMediaOne(int groupNum){
        return groupMediaDAO.selectGroupMediaOne(groupNum);
    }

    public List<byte[]> selectGroupMediaDetail(int groupNum){
        return groupMediaDAO.selectGroupMediaDetail(groupNum);
    }
}
