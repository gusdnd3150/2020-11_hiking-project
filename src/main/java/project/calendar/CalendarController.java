package project.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CalendarController {

    @Resource(name = "calendarService")
    private CalendarService calendarService;

    @GetMapping("/calendar.do")
    public String goCalendar(){
        return "calendar/main";
    }

    @GetMapping("/calender/selectCalendarByUserId.do")
    @ResponseBody
    public List selectCalendarByUserId(@RequestParam("userId")String userId){
        return calendarService.selectCalendarByUserId(userId);
    }
}
