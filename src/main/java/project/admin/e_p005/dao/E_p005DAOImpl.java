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

	@Override
	public List searchPayList(Map<String, String> search_keyword) throws Exception {
		System.out.println("다오 들어옴");
		List<String> search = sqlSession.selectList("admin.mapper.e_p005.searchPayList",search_keyword);
	
		System.out.println("다오 디비값: "+search);
		return search;
	}
}
