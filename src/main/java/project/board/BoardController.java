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

    @GetMapping("/board/select.do")
    public List selectNotice(@RequestParam("rowNum")int rowNum,
                             @RequestParam("type")String csPostType){
        Map map = new HashMap();
        map.put("rowNum",rowNum);
        map.put("csPostType",csPostType);
        return boardService.selectBoard(map);
    }
}
