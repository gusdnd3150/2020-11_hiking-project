package project.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    @Resource(name = "boardService")
    private BoardService boardService;

    @GetMapping("/board/notice.do")
    public List selectNotice(@RequestParam("rowNum")int rowNum,
                             @RequestParam("type")String type){
        Map map = new HashMap();
        map.put("rowNum",rowNum);
        map.put("type",type);
        return boardService.selectNotice(map);
    }
}
