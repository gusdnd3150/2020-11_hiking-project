package project.groupmedia.service;

import project.groupmedia.vo.GroupMediaVO;

import java.util.List;
import java.util.Map;

public interface GroupMediaService {
    void insertGroupMedia(GroupMediaVO groupMediaVO);
    Map<String, Object> selectGroupMedia(int groupNum);

    List<Map<String,Object>> selectGroupMediaOne(int groupNum);
}
