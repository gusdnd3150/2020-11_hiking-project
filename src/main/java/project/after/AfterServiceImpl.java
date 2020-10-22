package project.after;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("afterService")
public class AfterServiceImpl implements AfterService {

    @Resource(name = "afterDAO")
    private AfterDAO afterDAO;
    public int insertAfter(Map map) {
        return afterDAO.insertAfter(map);
    }
    public int checkAfterExist(Map map){return afterDAO.checkAfterExist(map);}
    public List selectAllAfterList(){
        return afterDAO.selectAllAfterList();
    }
    public List selectMainAfterList(){
        return afterDAO.selectMainAfterList();
    }
}
