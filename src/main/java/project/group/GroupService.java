package project.group;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface GroupService {

    int insertGroup(Map map) throws Exception;

    List<Map> selectMainGroupList();

    List<Map> selectAllGroupList();

    void updateGroup(GroupVO vo);

    void deleteGroup(int groupNum);

    Map selectGroupDetail(int groupNum);

    List<Map> selectGroupDetailImage(int groupNum);

    List<Map> selectGroupsByKeyword(String keyword);

    //
    void joinGroup(Map map);

    List<Integer> listApplied(int groupNum);
}
