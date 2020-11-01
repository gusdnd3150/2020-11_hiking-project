package project.B_P002_D001.Service;

import java.util.ArrayList;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Paging;
import project.B_P002_D001.dao.B_P002_D001ShopingMallDAO;
import project.E_P002_D003.dao.E_P002_D003ProductsDAO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;


//@Transactional(propagation=Propagation.REQUIRED)
@Service
public class B_P002_D001ShopingMallServiceImpl implements B_P002_D001ShopingMallService  {
	

	@Autowired
	private B_P002_D001ShopingMallDAO B_P002_D001ShopingMallDAO;
	
	
	@Override
	public int totalCount() {
		int totalCount = B_P002_D001ShopingMallDAO.totalCount();
		return totalCount;
	}
	@Override
	public List<E_P002_D003ProductsVO> shopListText2(Paging vo) throws DataAccessException {
		List<E_P002_D003ProductsVO> list = B_P002_D001ShopingMallDAO.shopListText2(vo);
		return list;
	}
	@Override
	public List<E_P002_D003PhotoVO> shopListImage(Map<String,Object> map) throws DataAccessException {
		List<E_P002_D003PhotoVO> list = B_P002_D001ShopingMallDAO.shopListImage(map);
		return list;
	}
	@Override
	public E_P002_D003PhotoVO getImage(E_P002_D003PhotoVO vo) throws DataAccessException {
		E_P002_D003PhotoVO result = B_P002_D001ShopingMallDAO.getImage(vo);
		return result;
	}
	
	@Override
	public List<E_P002_D003ProductsVO> shopListText() throws DataAccessException {
		List<E_P002_D003ProductsVO> list = B_P002_D001ShopingMallDAO.shopListText();
		return list;
	}
	@Override
	public int totalCount2(Map<String, Object> info) {//dddddddddddddd
		int totalCount = B_P002_D001ShopingMallDAO.totalCount2(info);
		return totalCount;
	}
	@Override
	public List<Map> shopListTextCate(Map<String,Object> map) throws DataAccessException {
		List<Map> list= B_P002_D001ShopingMallDAO.shopListTextCate(map);
		return list;
	}
	
	
	
	//////////////////작업중///////////////////////////
	@Override
	public List<Map> searchResult(Map<String, Object> info) throws DataAccessException {
		List<Map> list= B_P002_D001ShopingMallDAO.searchResult(info);
		return list;
	}
	@Override
	public int SearchTotalCount(Map<String, Object> info) {
		int totalCount = B_P002_D001ShopingMallDAO.SearchTotalCount(info);
		return totalCount;
	}
	
	@Override
	public List<Map> lastItems(Map<String, Object> info) throws DataAccessException {
		List<Map> list= B_P002_D001ShopingMallDAO.lastItems(info);
		return list;
	}
	@Override
	public List<Map> searchAllResult(Map<String, Object> info) throws DataAccessException {
		List<Map> list= B_P002_D001ShopingMallDAO.searchAllResult(info);
		return list;
	}
	@Override
	public int SearchAllTotalCount(Map<String, Object> info) {
		return B_P002_D001ShopingMallDAO.SearchAllTotalCount(info);
	}

	
	

	

}