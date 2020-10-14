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
        System.out.println("groupNum : "+ groupNum);
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

        List<Map> validUserList = chatService.checkValidUser(roomId);

        for(int i=0;i<validUserList.size();i++){
            String userId = (String) validUserList.get(i).get("USERID");
            if(userId.equals(sessionId)){
                return mav;
            }
        }
        mav.setViewName("redirect:/main.do");
        return mav;
    }
}
