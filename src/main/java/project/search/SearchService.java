package project.search;

import java.util.List;
import java.util.Map;

public interface SearchService {

    List searchKeyword(Map map);
    List suggestion(String keyword);
}
