package project.groupmedia;

import java.util.List;
import java.util.Map;

public interface GroupMediaService {
    void insertGroupMedia(GroupMediaVO groupMediaVO);
    byte[] selectGroupMediaOne(int groupNum);
    List<byte[]> selectGroupMediaDetail(int groupNum);
}
