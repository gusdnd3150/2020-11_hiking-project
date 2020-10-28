package project.after;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("afterService")
public class AfterServiceImpl implements AfterService {

    @Resource(name = "afterDAO")
    private AfterDAO afterDAO;

    @Transactional
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

    @Transactional
    public int insertCommentAfter(Map map){
        return afterDAO.insertCommentAfter(map);
    }

    public Map selectCommentOne(int commentNum){
        return afterDAO.selectCommentOne(commentNum);
    }

    public List selectCommentByAfterNum(int afterNum){
        return afterDAO.selectCommentByAfterNum(afterNum);
    }
}
