package project.search;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("searchService")
public class SearchServiceImpl implements SearchService{

    @Resource(name = "searchDAO")
    private SearchDAO searchDAO;

    public List searchKeywordTrail(Map map){
        return searchDAO.searchKeywordTrail(map);
    }
    public List searchKeywordGroup(Map map){
        return searchDAO.searchKeywordGroup(map);
    }
    public List searchKeywordMoim(Map map){
        return searchDAO.searchKeywordMoim(map);
    }
    public List suggestion(String keyword){
        return searchDAO.suggestion(keyword);
    }
    public void saveKeyword(Map map){
        searchDAO.saveKeyword(map);
    }
    public List selectKeywordRank(){
        return searchDAO.selectKeywordRank();
    }
    public List mainKeywordSearch(Map map){
        return searchDAO.mainKeywordSearch(map);
    }
}
