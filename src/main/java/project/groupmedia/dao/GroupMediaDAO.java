package project.groupmedia.dao;

import project.groupmedia.vo.GroupMediaVO;

import java.util.List;
import java.util.Map;

public interface GroupMediaDAO {
    void insertGroupMedia(GroupMediaVO groupMediaVO) throws Exception;
    List<GroupMediaVO> selectGroupMediaList() throws Exception;
    byte[] selectGroupMediaOne(int groupNum) throws Exception;
}
