package project.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

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
        ModelAndView mav = new ModelAndView("/chat/chatRoom");
        String userId = (String) request.getSession().getAttribute("LOGIN");

        List<Map> list = chatService.selectChatByRoomId(roomId);

        if(list==null){
            mav.addObject("roomId",roomId);
            return mav;
        }

        System.out.println(list.toString());

        for(int i=0;i<list.size();i++){
            System.out.println("roomId : " + list.get(i).get("ROOMID"));
            System.out.println("userId : " + list.get(i).get("USERID"));
            System.out.println("message : " + list.get(i).get("message"));
            System.out.println("time : " + list.get(i).get("TIME"));

            mav.addObject("roomId",list.get(i).get("ROOMID"));
            mav.addObject("userId", list.get(i).get("USERID"));
            mav.addObject("message", list.get(i).get("message"));
            mav.addObject("time", list.get(i).get("TIME"));
        }

        int count = 0;
        for(Map m : list){
            if(m.get("USERID").equals(userId) == false){
                mav.addObject("receiver",m.get("USERID"));
                count++;
            }
        }

        if(count>list.size()){
            mav.setViewName("redirect:/main.do");
        }

        System.out.println("데이터 : " + mav.toString());

        return mav;
    }
}
