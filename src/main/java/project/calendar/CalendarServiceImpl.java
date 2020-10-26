package project.calendar;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

    @Resource(name = "calendarDAO")
    private CalendarDAO calendarDAO;

    public List selectCalendarByUserId(String userId){
        return calendarDAO.selectCalendarByUserId(userId);
    }
}
