package project.B_P002_D001.dao;


import java.util.ArrayList;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.Paging;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;



@Repository
public class B_P002_D001ShopingMallDAOImpl implements B_P002_D001ShopingMallDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int totalCount() {
		int totalCount = sqlSession.selectOne("countBoard");
		return totalCount;
	}
	@Override
	public List<E_P002_D003ProductsVO> shopListText2(Paging vo) throws DataAccessException {//메인 페이지
		List<E_P002_D003ProductsVO> list= sqlSession.selectList("project.e_P002_D003.selectProduct",vo);
		return list;
	}
	@Override
	public List<E_P002_D003PhotoVO> shopListImage(Paging vo) throws DataAccessException { //메인 상품 이미지 리스트
		List<E_P002_D003PhotoVO> list= sqlSession.selectList("project.e_P002_D003.shopMainImage",vo);
		return list;             
	}
	
	
	
	

	@Override
	public List<E_P002_D003ProductsVO> shopListText() throws DataAccessException { // 메인에 노출될 텍스트
		List<E_P002_D003ProductsVO> list= sqlSession.selectList("project.e_P002_D003.shopMainText");
		return list;
	}
	@Override
	public E_P002_D003PhotoVO getImage(E_P002_D003PhotoVO vo) throws DataAccessException {
		E_P002_D003PhotoVO vor = sqlSession.selectOne("project.e_P002_D003.getByteImage", vo);
		return vor;
	}


	
}
