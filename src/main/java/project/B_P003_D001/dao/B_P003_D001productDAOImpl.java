package project.B_P003_D001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;

@Repository
public class B_P003_D001productDAOImpl implements B_P003_D001productDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public E_P002_D003ProductsVO topDetail(Map<String, Object> map) throws DataAccessException {
		E_P002_D003ProductsVO vo = sqlSession.selectOne("project.e_P002_D003.selectProductDetail",map);
		return vo;
	}
	@Override
	public List<E_P002_D003PhotoVO> detailImages(Map<String, Object> map) throws DataAccessException {
          List<E_P002_D003PhotoVO> list = sqlSession.selectList("project.e_P002_D003.selectProductDetailImages",map);
		return list;
	}
	@Override
	public void addAfter(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.addAfter",map);
	}
	
	@Override
	public List<productAfterVO> afterList(Map<String, Object> map) throws DataAccessException {
		 List<productAfterVO> list = sqlSession.selectList("project.e_P002_D003.afterList",map);
			return list;
	}
	@Override
	public int afterTotal(Map<String,Object> map) {
		int total = sqlSession.selectOne("project.e_P002_D003.afterTotal",map);
		return total;
	}
	@Override
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException {
		productAfterVO result = sqlSession.selectOne("project.e_P002_D003.detailImage",vo);
		return result;
	}
	@Override
	public void addComent(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.addComent",map);		
	}

}
