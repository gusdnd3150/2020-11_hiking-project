package project.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalendarController {

    @GetMapping("/calendar.do")
    public String goCalendar(){
        return "calendar/main";
    }
}
