package project.calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("calendarDAO")
public class CalendarDAO {

    @Autowired
    private SqlSession sqlSession;

    public List selectCalendarByUserId(String userId){
        return sqlSession.selectList("calendar.selectCalendarByUserId",userId);
    }
}
