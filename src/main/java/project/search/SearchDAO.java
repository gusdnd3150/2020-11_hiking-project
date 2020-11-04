package project.search;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("searchDAO")
public class SearchDAO {

    @Autowired
    private SqlSession sqlSession;

    public List searchKeywordTrail(Map map){
        return sqlSession.selectList("search.searchKeywordTrail",map);
    }
    public List searchKeywordGroup(Map map){
        return sqlSession.selectList("search.searchKeywordGroup",map);
    }
    public List searchKeywordMoim(Map map){
        return sqlSession.selectList("search.searchKeywordMoim",map);
    }
    public List suggestion(String keyword){
        return sqlSession.selectList("search.suggestion",keyword);
    }
    public void saveKeyword(Map map){
        sqlSession.insert("search.saveKeyword",map);
    }
    public List selectKeywordRank(){
        return sqlSession.selectList("search.selectKeywordRank");
    }
    public List mainKeywordSearch(Map map){
        return sqlSession.selectList("search.mainKeywordSearch",map);
    }
}
