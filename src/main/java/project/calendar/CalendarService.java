package project.calendar;

import java.util.List;

public interface CalendarService {

    List selectCalendarByUserId(String userId);
}
