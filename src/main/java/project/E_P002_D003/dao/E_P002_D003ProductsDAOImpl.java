package project.E_P002_D003.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class E_P002_D003ProductsDAOImpl  implements E_P002_D003ProductsDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void addProduct(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("project.e_P002_D003.addProduct", datahMap);
	}
	

	
	/*
	@Override
	public void saveImage(Map<String, Object> hmap) {
		sqlSession.insert("project.e_P002_D003.saveImage",hmap);
	}
	@Override
	public Map<String, Object> getByteImage() {
		return sqlSession.selectOne("project.e_P002_D003.getByteImage");
	}*/

}