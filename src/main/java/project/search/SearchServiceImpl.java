package project.search;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("searchService")
public class SearchServiceImpl implements SearchService{

    @Resource(name = "searchDAO")
    private SearchDAO searchDAO;

    public List searchKeyword(Map map){
        return searchDAO.searchKeyword(map);
    }
    public List suggestion(String keyword){
        return searchDAO.suggestion(keyword);
    }
}
