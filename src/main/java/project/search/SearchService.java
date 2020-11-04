package project.search;

import java.util.List;
import java.util.Map;

public interface SearchService {

    List searchKeywordTrail(Map map);
    List searchKeywordGroup(Map map);
    List searchKeywordMoim(Map map);


    List suggestion(String keyword);
    void saveKeyword(Map map);
    List selectKeywordRank();
    List mainKeywordSearch(Map map);
}
