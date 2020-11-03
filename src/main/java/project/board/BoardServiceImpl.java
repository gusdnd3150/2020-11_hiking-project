package project.board;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

    @Resource(name = "boardDAO")
    private BoardDAO boardDAO;

    public List selectNotice(Map map){
        return boardDAO.selectNotice(map);
    }
}
