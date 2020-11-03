package project.after;

import java.util.List;
import java.util.Map;

public interface AfterService {
    int insertAfter(Map map);
    int checkAfterExist(Map map);
    List selectAllAfterList();
    List selectMainAfterList();

    int insertCommentAfter(Map map);
    int updateSubCommentCount(Map map);
    Map selectCommentOne(int commentNum);
    List selectCommentByAfterNum(int afterNum);
    List selectAfterDetail(int afterNum);

    int selectLikeCount(int afterNum);
    void insertAfterLike(Map map);
    void updateAfterLike(Map map);
    int checkAfterLike(Map map);
}
