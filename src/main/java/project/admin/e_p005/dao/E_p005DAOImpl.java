package project.admin.e_p005.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.admin.e_p005.vo.E_p005VO;


@Repository
public class E_p005DAOImpl implements E_p005DAO{
	
	@Autowired
	private SqlSession sqlSession;

	//지정일자 매출 조회
	@Override
	public List searchPayList(Map<String, String> search_keyword) throws Exception {
		List<String> search = sqlSession.selectList("admin.mapper.e_p005.searchPayList",search_keyword);
		return search;
	}

	//조회시 총 매출
	@Override
	public String sumPrice(Map<String, String> search_keyword) throws Exception {
		String sumPrice = sqlSession.selectOne("admin.mapper.e_p005.sumPrice", search_keyword);
		return sumPrice;
	}

	//조회시 평균 매출
	@Override
	public String avgPrice(Map<String, String> search_keyword) throws Exception {
		String avgPrice =  sqlSession.selectOne("admin.mapper.e_p005.avgPrice", search_keyword);
		return avgPrice;
	}

	@Override
	public List selectSearch(Map<String, String> select_keyword) throws Exception {
		List selectSearch = sqlSession.selectList("admin.mapper.e_p005.selectSearch",select_keyword);
		return selectSearch;
	}

	//금일 매출
	@Override
	public String toDaySales(Map map) throws Exception {
		return sqlSession.selectOne("admin.mapper.e_p005.toDaySales",map);
	}
}
