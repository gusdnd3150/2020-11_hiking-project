package project.groupmedia.service;

import project.groupmedia.vo.GroupMediaVO;

import java.util.List;

public interface GroupMediaService {
    void insertGroupMedia(GroupMediaVO groupMediaVO);
    List<GroupMediaVO> selectGroupMediaList();

    byte[] selectGroupMediaOne(int groupNum);
}
