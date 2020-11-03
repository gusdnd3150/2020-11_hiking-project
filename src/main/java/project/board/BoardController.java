package project.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    @Resource(name = "boardService")
    private BoardService boardService;

    @GetMapping("/board/select.do")
    @ResponseBody
    public List selectNotice(@RequestParam("rowNum")int rowNum,
                             @RequestParam("csPostType")String csPostType){
        Map map = new HashMap();
        map.put("rowNum",rowNum);
        map.put("csPostType",csPostType);

        return boardService.selectBoard(map);
    }

    @GetMapping("/board/allCount.do")
    @ResponseBody
    public int selectBoardAllCount(@RequestParam("csPostType")String csPostType){
        return boardService.selectBoardAllCount(csPostType);
    }

    @GetMapping("/board/{csPostNum}.do")
    public ModelAndView boardDetail(@PathVariable("csPostNum")int csPostNum){
        ModelAndView mav = new ModelAndView("detail");

        List list = boardService.selectBoardDetail(csPostNum);

        mav.addObject("post",list);
        return mav;
    }
}
