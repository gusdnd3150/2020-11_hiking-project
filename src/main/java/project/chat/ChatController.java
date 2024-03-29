package project.chat;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class ChatController {

    @Resource(name = "chatService")
    private ChatService chatService;

    @GetMapping("/chat.do")
    public String newChat(@RequestParam("groupNum") int groupNum){
        String roomId = chatService.newChat(groupNum);
        return "redirect:/chat/" + roomId ;
    }

    @GetMapping("/chat/{roomId}")
    public ModelAndView goChat(@PathVariable("roomId")String roomId, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("/chatting/chatRoom");
        String sessionId = (String) request.getSession().getAttribute("LOGIN");

        List<Map>list = chatService.selectChatByRoomId(roomId);

        if(list==null){
            mav.addObject("roomId",roomId);
            return mav;
        }

        mav.addObject("resultList", list);

        Map map = new HashMap();
        map.put("roomId",roomId);
        map.put("userId",sessionId);
        List<Map> userInfo = chatService.checkValidUser(map);
        String userId = (String) userInfo.get(0).get("ID");

            if(userId.equals(sessionId)){
                mav.addObject("userInfo",userInfo);
                return mav;
            }

        mav.setViewName("redirect:/main.do");
        return mav;
    }
}
