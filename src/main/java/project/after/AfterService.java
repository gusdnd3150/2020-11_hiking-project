package project.after;

import java.util.List;
import java.util.Map;

public interface AfterService {
    int insertAfter(Map map);
    int checkAfterExist(Map map);
    List selectAllAfterList();
}
