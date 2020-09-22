package project.groupmedia.dao;

import project.groupmedia.vo.GroupMediaVO;

import java.util.List;
import java.util.Map;

public interface GroupMediaDAO {
    void insertGroupMedia(GroupMediaVO groupMediaVO) throws Exception;
    Map<String, Object> selectGroupMedia(int groupNum) throws Exception;

    List<Map<String,Object>> selectGroupMediaOne(int groupNum) throws Exception;
}
