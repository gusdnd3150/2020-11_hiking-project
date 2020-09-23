package project.groupmedia;

import java.util.List;
import java.util.Map;

public interface GroupMediaService {
    void insertGroupMedia(GroupMediaVO groupMediaVO);
    Map<String, Object> selectGroupMediaOne(int groupNum);
}
